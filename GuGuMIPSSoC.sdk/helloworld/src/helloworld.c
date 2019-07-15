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

#include <stdio.h>
#include "platform.h"
#include "xil_printf.h"

#include "usb_hw.h"
#include "usb_core.h"

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

int main()
{
  struct usb_device dev;
  init_platform();

  Xil_DCacheDisable();

  print("Hello World USB\r\n");

  /*
      while (1) {
          usleep(1000000);
          print("Read Ctrl\r\n");
          xil_printf("ctrl %08x\r\n", *USB_CTRL);
          print("Read status\r\n");
          xil_printf("status %08x\r\n", *USB_STATUS);
          print("Read irq\r\n");
          xil_printf("irq %08x\r\n", *USB_IRQ_STS);
      }
      */

  usbhw_init(0x40000000);
  usbhw_reset();

  usb_init();
  xil_printf("Device detected, full: %d\r\n", usbhw_hub_full_speed_device());
  int res = usb_configure_device(&dev, 0);
  xil_printf("configure with res %d\r\n", res);

  while (1) {
          usleep(1000000);
          xil_printf("ctrl %08x\r\n", *USB_CTRL);
          xil_printf("status %08x\r\n", *USB_STATUS);
          xil_printf("stat %08x\r\n", *USB_RX_STAT);
          xil_printf("irq %08x\r\n", *USB_IRQ_STS);
          *USB_IRQ_ACK = *USB_IRQ_STS;
  };

  cleanup_platform();
  return 0;
}
