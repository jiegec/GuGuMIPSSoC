/******************************************************************************
 *
 * Copyright (C) 2009 - 2014 Xilinx, Inc.  All rights reserved.
 *
 * Permission is hereby granted, free of charge, to any person obtaining a copy
 * of this software and associated documentation files (the "Software"), to deal
 * in the Software without restriction, including without limitation the rights
 * to use, copy, modify, merge, publish, distribute, sublicense, and/or sell
 * copies of the Software, and to permit persons to whom the Software is
 * furnished to do so, subject to the following conditions:
 *
 * The above copyright notice and this permission notice shall be included in
 * all copies or substantial portions of the Software.
 *
 * Use of the Software is limited solely to applications:
 * (a) running on a Xilinx device, or
 * (b) that interact with a Xilinx device through a bus or interconnect.
 *
 * THE SOFTWARE IS PROVIDED "AS IS", WITHOUT WARRANTY OF ANY KIND, EXPRESS OR
 * IMPLIED, INCLUDING BUT NOT LIMITED TO THE WARRANTIES OF MERCHANTABILITY,
 * FITNESS FOR A PARTICULAR PURPOSE AND NONINFRINGEMENT. IN NO EVENT SHALL
 * XILINX  BE LIABLE FOR ANY CLAIM, DAMAGES OR OTHER LIABILITY,
 * WHETHER IN AN ACTION OF CONTRACT, TORT OR OTHERWISE, ARISING FROM, OUT OF
 * OR IN CONNECTION WITH THE SOFTWARE OR THE USE OR OTHER DEALINGS IN THE
 * SOFTWARE.
 *
 * Except as contained in this notice, the name of the Xilinx shall not be used
 * in advertising or otherwise to promote the sale, use or other dealings in
 * this Software without prior written authorization from Xilinx.
 *
 ******************************************************************************/

/*
 * helloworld.c: simple test application
 *
 * This application configures UART 16550 to baud rate 9600.
 * PS7 UART (Zynq) is not initialized by this application, since
 * bootrom/bsp configures it to baud rate 115200
 *
 * ------------------------------------------------
 * | UART TYPE   BAUD RATE                        |
 * ------------------------------------------------
 *   uartns550   9600
 *   uartlite    Configurable only in HW design
 *   ps7_uart    115200 (configured by bootrom/bsp)
 */

#include "platform.h"
#include "xil_printf.h"
#include <stdio.h>

#include "usb_core.h"
#include "usb_hw.h"

volatile u32 *USB_CTRL = (u32 *)0x40000000;
volatile u32 *USB_STATUS = (u32 *)0x40000004;
volatile u32 *USB_IRQ_ACK = (u32 *)0x40000008;
volatile u32 *USB_IRQ_STS = (u32 *)0x4000000c;
volatile u32 *USB_IRQ_MASK = (u32 *)0x40000010;
volatile u32 *USB_XFER_DATA = (u32 *)0x40000014;
volatile u32 *USB_XFER_TOKEN = (u32 *)0x40000018;
volatile u32 *USB_RX_STAT = (u32 *)0x4000001c;
volatile u32 *USB_WR_DATA = (u32 *)0x40000020;
volatile u32 *USB_RD_DATA = (u32 *)0x40000020;

int usb_enum_interface(struct usb_device *dev, struct usb_interface *intp) {
  xil_printf("Enum interface:\r\n");
  xil_printf("\tClass: 0x%02x Subclass: 0x%02x Proto: 0x%02x\r\n",
             intp->if_class, intp->if_subclass, intp->if_protocol);
  for (uint8_t i = 0; i < intp->if_endpoints; i++) {
    xil_printf("\tEndpoint #%d: 0x%02x %S\r\n", i, intp->endpoint[i].endpoint,
               intp->endpoint[i].direction ? "IN" : "OUT");
    switch (intp->endpoint[i].endpoint_type) {
    case 0x0:
      xil_printf("\t\tEndpoint Type: CONTROL\r\n");
      break;
    case 0x1:
      xil_printf("\t\tEndpoint Type: ISOCHRONOUS\r\n");
      break;
    case 0x2:
      xil_printf("\t\tEndpoint Type: BULK\r\n");
      break;
    case 0x3:
      xil_printf("\t\tEndpoint Type: INTERRUPT\r\n");
      break;
    default:
      xil_printf("\t\tEndpoint Type: UNKNOWN\r\n");
      break;
    }
    xil_printf("\t\tMax Packet Size: 0x%04x\r\n",
               intp->endpoint[i].max_packet_size);
    xil_printf("\t\tData Toggle: 0x%02x\r\n", intp->endpoint[i].data_toggle);
  }
  return 1;
}

int usb_enum_class_specific(struct usb_device *dev, struct usb_interface *intp,
                            void *desc) {

  xil_printf("Enum class specific:\r\n");
  usb_enum_interface(dev, intp);
  return 1;
}

int main() {
  struct usb_device dev;
  init_platform();

  Xil_DCacheDisable();

  print("Hello World USB\r\n");

  usbhw_init(0x40000000);
  usbhw_reset();

  usb_init();
  usleep(100000);
  xil_printf("Device detected, full: %d\r\n", usbhw_hub_full_speed_device());
  int res = usb_configure_device(&dev, 0);
  xil_printf("configure with res %d\r\n", res);

  usb_enumerate(&dev, usb_enum_interface, usb_enum_class_specific);

  while (1) {
    usleep(10000000);
    *USB_IRQ_ACK = *USB_IRQ_STS;
  };

  cleanup_platform();
  return 0;
}
