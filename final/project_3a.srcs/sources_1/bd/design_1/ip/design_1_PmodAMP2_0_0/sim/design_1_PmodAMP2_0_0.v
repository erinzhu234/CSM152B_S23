// (c) Copyright 1995-2023 Xilinx, Inc. All rights reserved.
// 
// This file contains confidential and proprietary information
// of Xilinx, Inc. and is protected under U.S. and
// international copyright and other intellectual property
// laws.
// 
// DISCLAIMER
// This disclaimer is not a license and does not grant any
// rights to the materials distributed herewith. Except as
// otherwise provided in a valid license issued to you by
// Xilinx, and to the maximum extent permitted by applicable
// law: (1) THESE MATERIALS ARE MADE AVAILABLE "AS IS" AND
// WITH ALL FAULTS, AND XILINX HEREBY DISCLAIMS ALL WARRANTIES
// AND CONDITIONS, EXPRESS, IMPLIED, OR STATUTORY, INCLUDING
// BUT NOT LIMITED TO WARRANTIES OF MERCHANTABILITY, NON-
// INFRINGEMENT, OR FITNESS FOR ANY PARTICULAR PURPOSE; and
// (2) Xilinx shall not be liable (whether in contract or tort,
// including negligence, or under any other theory of
// liability) for any loss or damage of any kind or nature
// related to, arising under or in connection with these
// materials, including for any direct, or any indirect,
// special, incidental, or consequential loss or damage
// (including loss of data, profits, goodwill, or any type of
// loss or damage suffered as a result of any action brought
// by a third party) even if such damage or loss was
// reasonably foreseeable or Xilinx had been advised of the
// possibility of the same.
// 
// CRITICAL APPLICATIONS
// Xilinx products are not designed or intended to be fail-
// safe, or for use in any application requiring fail-safe
// performance, such as life-support or safety devices or
// systems, Class III medical devices, nuclear facilities,
// applications related to the deployment of airbags, or any
// other applications that could lead to death, personal
// injury, or severe property or environmental damage
// (individually and collectively, "Critical
// Applications"). Customer assumes the sole risk and
// liability of any use of Xilinx products in Critical
// Applications, subject only to applicable laws and
// regulations governing limitations on product liability.
// 
// THIS COPYRIGHT NOTICE AND DISCLAIMER MUST BE RETAINED AS
// PART OF THIS FILE AT ALL TIMES.
// 
// DO NOT MODIFY THIS FILE.


// IP VLNV: digilentinc.com:IP:PmodAMP2:1.0
// IP Revision: 11

`timescale 1ns/1ps

(* DowngradeIPIdentifiedWarnings = "yes" *)
module design_1_PmodAMP2_0_0 (
  AXI_LITE_GPIO_araddr,
  AXI_LITE_GPIO_arready,
  AXI_LITE_GPIO_arvalid,
  AXI_LITE_GPIO_awaddr,
  AXI_LITE_GPIO_awready,
  AXI_LITE_GPIO_awvalid,
  AXI_LITE_GPIO_bready,
  AXI_LITE_GPIO_bresp,
  AXI_LITE_GPIO_bvalid,
  AXI_LITE_GPIO_rdata,
  AXI_LITE_GPIO_rready,
  AXI_LITE_GPIO_rresp,
  AXI_LITE_GPIO_rvalid,
  AXI_LITE_GPIO_wdata,
  AXI_LITE_GPIO_wready,
  AXI_LITE_GPIO_wstrb,
  AXI_LITE_GPIO_wvalid,
  AXI_LITE_PWM_araddr,
  AXI_LITE_PWM_arprot,
  AXI_LITE_PWM_arready,
  AXI_LITE_PWM_arvalid,
  AXI_LITE_PWM_awaddr,
  AXI_LITE_PWM_awprot,
  AXI_LITE_PWM_awready,
  AXI_LITE_PWM_awvalid,
  AXI_LITE_PWM_bready,
  AXI_LITE_PWM_bresp,
  AXI_LITE_PWM_bvalid,
  AXI_LITE_PWM_rdata,
  AXI_LITE_PWM_rready,
  AXI_LITE_PWM_rresp,
  AXI_LITE_PWM_rvalid,
  AXI_LITE_PWM_wdata,
  AXI_LITE_PWM_wready,
  AXI_LITE_PWM_wstrb,
  AXI_LITE_PWM_wvalid,
  AXI_LITE_TIMER_araddr,
  AXI_LITE_TIMER_arready,
  AXI_LITE_TIMER_arvalid,
  AXI_LITE_TIMER_awaddr,
  AXI_LITE_TIMER_awready,
  AXI_LITE_TIMER_awvalid,
  AXI_LITE_TIMER_bready,
  AXI_LITE_TIMER_bresp,
  AXI_LITE_TIMER_bvalid,
  AXI_LITE_TIMER_rdata,
  AXI_LITE_TIMER_rready,
  AXI_LITE_TIMER_rresp,
  AXI_LITE_TIMER_rvalid,
  AXI_LITE_TIMER_wdata,
  AXI_LITE_TIMER_wready,
  AXI_LITE_TIMER_wstrb,
  AXI_LITE_TIMER_wvalid,
  Pmod_out_pin10_i,
  Pmod_out_pin10_o,
  Pmod_out_pin10_t,
  Pmod_out_pin1_i,
  Pmod_out_pin1_o,
  Pmod_out_pin1_t,
  Pmod_out_pin2_i,
  Pmod_out_pin2_o,
  Pmod_out_pin2_t,
  Pmod_out_pin3_i,
  Pmod_out_pin3_o,
  Pmod_out_pin3_t,
  Pmod_out_pin4_i,
  Pmod_out_pin4_o,
  Pmod_out_pin4_t,
  Pmod_out_pin7_i,
  Pmod_out_pin7_o,
  Pmod_out_pin7_t,
  Pmod_out_pin8_i,
  Pmod_out_pin8_o,
  Pmod_out_pin8_t,
  Pmod_out_pin9_i,
  Pmod_out_pin9_o,
  Pmod_out_pin9_t,
  s_axi_aclk,
  s_axi_aresetn,
  timer_interrupt
);

(* X_INTERFACE_INFO = "xilinx.com:interface:aximm:1.0 AXI_LITE_GPIO ARADDR" *)
input wire [8 : 0] AXI_LITE_GPIO_araddr;
(* X_INTERFACE_INFO = "xilinx.com:interface:aximm:1.0 AXI_LITE_GPIO ARREADY" *)
output wire AXI_LITE_GPIO_arready;
(* X_INTERFACE_INFO = "xilinx.com:interface:aximm:1.0 AXI_LITE_GPIO ARVALID" *)
input wire AXI_LITE_GPIO_arvalid;
(* X_INTERFACE_INFO = "xilinx.com:interface:aximm:1.0 AXI_LITE_GPIO AWADDR" *)
input wire [8 : 0] AXI_LITE_GPIO_awaddr;
(* X_INTERFACE_INFO = "xilinx.com:interface:aximm:1.0 AXI_LITE_GPIO AWREADY" *)
output wire AXI_LITE_GPIO_awready;
(* X_INTERFACE_INFO = "xilinx.com:interface:aximm:1.0 AXI_LITE_GPIO AWVALID" *)
input wire AXI_LITE_GPIO_awvalid;
(* X_INTERFACE_INFO = "xilinx.com:interface:aximm:1.0 AXI_LITE_GPIO BREADY" *)
input wire AXI_LITE_GPIO_bready;
(* X_INTERFACE_INFO = "xilinx.com:interface:aximm:1.0 AXI_LITE_GPIO BRESP" *)
output wire [1 : 0] AXI_LITE_GPIO_bresp;
(* X_INTERFACE_INFO = "xilinx.com:interface:aximm:1.0 AXI_LITE_GPIO BVALID" *)
output wire AXI_LITE_GPIO_bvalid;
(* X_INTERFACE_INFO = "xilinx.com:interface:aximm:1.0 AXI_LITE_GPIO RDATA" *)
output wire [31 : 0] AXI_LITE_GPIO_rdata;
(* X_INTERFACE_INFO = "xilinx.com:interface:aximm:1.0 AXI_LITE_GPIO RREADY" *)
input wire AXI_LITE_GPIO_rready;
(* X_INTERFACE_INFO = "xilinx.com:interface:aximm:1.0 AXI_LITE_GPIO RRESP" *)
output wire [1 : 0] AXI_LITE_GPIO_rresp;
(* X_INTERFACE_INFO = "xilinx.com:interface:aximm:1.0 AXI_LITE_GPIO RVALID" *)
output wire AXI_LITE_GPIO_rvalid;
(* X_INTERFACE_INFO = "xilinx.com:interface:aximm:1.0 AXI_LITE_GPIO WDATA" *)
input wire [31 : 0] AXI_LITE_GPIO_wdata;
(* X_INTERFACE_INFO = "xilinx.com:interface:aximm:1.0 AXI_LITE_GPIO WREADY" *)
output wire AXI_LITE_GPIO_wready;
(* X_INTERFACE_INFO = "xilinx.com:interface:aximm:1.0 AXI_LITE_GPIO WSTRB" *)
input wire [3 : 0] AXI_LITE_GPIO_wstrb;
(* X_INTERFACE_PARAMETER = "XIL_INTERFACENAME AXI_LITE_GPIO, DATA_WIDTH 32, PROTOCOL AXI4LITE, ID_WIDTH 0, ADDR_WIDTH 9, AWUSER_WIDTH 0, ARUSER_WIDTH 0, WUSER_WIDTH 0, RUSER_WIDTH 0, BUSER_WIDTH 0, READ_WRITE_MODE READ_WRITE, HAS_BURST 0, HAS_LOCK 0, HAS_PROT 0, HAS_CACHE 0, HAS_QOS 0, HAS_REGION 0, HAS_WSTRB 1, HAS_BRESP 1, HAS_RRESP 1, SUPPORTS_NARROW_BURST 0, NUM_READ_OUTSTANDING 1, NUM_WRITE_OUTSTANDING 1, MAX_BURST_LENGTH 1, FREQ_HZ 100000000, PHASE 0.0, CLK_DOMAIN /clk_wiz_0_clk_out1, NUM_READ_THREADS 1, NUM_WRITE_TH\
READS 1, RUSER_BITS_PER_BYTE 0, WUSER_BITS_PER_BYTE 0" *)
(* X_INTERFACE_INFO = "xilinx.com:interface:aximm:1.0 AXI_LITE_GPIO WVALID" *)
input wire AXI_LITE_GPIO_wvalid;
(* X_INTERFACE_INFO = "xilinx.com:interface:aximm:1.0 AXI_LITE_PWM ARADDR" *)
input wire [6 : 0] AXI_LITE_PWM_araddr;
(* X_INTERFACE_INFO = "xilinx.com:interface:aximm:1.0 AXI_LITE_PWM ARPROT" *)
input wire [2 : 0] AXI_LITE_PWM_arprot;
(* X_INTERFACE_INFO = "xilinx.com:interface:aximm:1.0 AXI_LITE_PWM ARREADY" *)
output wire AXI_LITE_PWM_arready;
(* X_INTERFACE_INFO = "xilinx.com:interface:aximm:1.0 AXI_LITE_PWM ARVALID" *)
input wire AXI_LITE_PWM_arvalid;
(* X_INTERFACE_INFO = "xilinx.com:interface:aximm:1.0 AXI_LITE_PWM AWADDR" *)
input wire [6 : 0] AXI_LITE_PWM_awaddr;
(* X_INTERFACE_INFO = "xilinx.com:interface:aximm:1.0 AXI_LITE_PWM AWPROT" *)
input wire [2 : 0] AXI_LITE_PWM_awprot;
(* X_INTERFACE_INFO = "xilinx.com:interface:aximm:1.0 AXI_LITE_PWM AWREADY" *)
output wire AXI_LITE_PWM_awready;
(* X_INTERFACE_INFO = "xilinx.com:interface:aximm:1.0 AXI_LITE_PWM AWVALID" *)
input wire AXI_LITE_PWM_awvalid;
(* X_INTERFACE_INFO = "xilinx.com:interface:aximm:1.0 AXI_LITE_PWM BREADY" *)
input wire AXI_LITE_PWM_bready;
(* X_INTERFACE_INFO = "xilinx.com:interface:aximm:1.0 AXI_LITE_PWM BRESP" *)
output wire [1 : 0] AXI_LITE_PWM_bresp;
(* X_INTERFACE_INFO = "xilinx.com:interface:aximm:1.0 AXI_LITE_PWM BVALID" *)
output wire AXI_LITE_PWM_bvalid;
(* X_INTERFACE_INFO = "xilinx.com:interface:aximm:1.0 AXI_LITE_PWM RDATA" *)
output wire [31 : 0] AXI_LITE_PWM_rdata;
(* X_INTERFACE_INFO = "xilinx.com:interface:aximm:1.0 AXI_LITE_PWM RREADY" *)
input wire AXI_LITE_PWM_rready;
(* X_INTERFACE_INFO = "xilinx.com:interface:aximm:1.0 AXI_LITE_PWM RRESP" *)
output wire [1 : 0] AXI_LITE_PWM_rresp;
(* X_INTERFACE_INFO = "xilinx.com:interface:aximm:1.0 AXI_LITE_PWM RVALID" *)
output wire AXI_LITE_PWM_rvalid;
(* X_INTERFACE_INFO = "xilinx.com:interface:aximm:1.0 AXI_LITE_PWM WDATA" *)
input wire [31 : 0] AXI_LITE_PWM_wdata;
(* X_INTERFACE_INFO = "xilinx.com:interface:aximm:1.0 AXI_LITE_PWM WREADY" *)
output wire AXI_LITE_PWM_wready;
(* X_INTERFACE_INFO = "xilinx.com:interface:aximm:1.0 AXI_LITE_PWM WSTRB" *)
input wire [3 : 0] AXI_LITE_PWM_wstrb;
(* X_INTERFACE_PARAMETER = "XIL_INTERFACENAME AXI_LITE_PWM, DATA_WIDTH 32, PROTOCOL AXI4LITE, ID_WIDTH 0, ADDR_WIDTH 7, AWUSER_WIDTH 0, ARUSER_WIDTH 0, WUSER_WIDTH 0, RUSER_WIDTH 0, BUSER_WIDTH 0, READ_WRITE_MODE READ_WRITE, HAS_BURST 0, HAS_LOCK 0, HAS_PROT 1, HAS_CACHE 0, HAS_QOS 0, HAS_REGION 0, HAS_WSTRB 1, HAS_BRESP 1, HAS_RRESP 1, SUPPORTS_NARROW_BURST 0, NUM_READ_OUTSTANDING 1, NUM_WRITE_OUTSTANDING 1, MAX_BURST_LENGTH 1, FREQ_HZ 100000000, PHASE 0.0, CLK_DOMAIN /clk_wiz_0_clk_out1, NUM_READ_THREADS 1, NUM_WRITE_THR\
EADS 1, RUSER_BITS_PER_BYTE 0, WUSER_BITS_PER_BYTE 0" *)
(* X_INTERFACE_INFO = "xilinx.com:interface:aximm:1.0 AXI_LITE_PWM WVALID" *)
input wire AXI_LITE_PWM_wvalid;
(* X_INTERFACE_INFO = "xilinx.com:interface:aximm:1.0 AXI_LITE_TIMER ARADDR" *)
input wire [4 : 0] AXI_LITE_TIMER_araddr;
(* X_INTERFACE_INFO = "xilinx.com:interface:aximm:1.0 AXI_LITE_TIMER ARREADY" *)
output wire AXI_LITE_TIMER_arready;
(* X_INTERFACE_INFO = "xilinx.com:interface:aximm:1.0 AXI_LITE_TIMER ARVALID" *)
input wire AXI_LITE_TIMER_arvalid;
(* X_INTERFACE_INFO = "xilinx.com:interface:aximm:1.0 AXI_LITE_TIMER AWADDR" *)
input wire [4 : 0] AXI_LITE_TIMER_awaddr;
(* X_INTERFACE_INFO = "xilinx.com:interface:aximm:1.0 AXI_LITE_TIMER AWREADY" *)
output wire AXI_LITE_TIMER_awready;
(* X_INTERFACE_INFO = "xilinx.com:interface:aximm:1.0 AXI_LITE_TIMER AWVALID" *)
input wire AXI_LITE_TIMER_awvalid;
(* X_INTERFACE_INFO = "xilinx.com:interface:aximm:1.0 AXI_LITE_TIMER BREADY" *)
input wire AXI_LITE_TIMER_bready;
(* X_INTERFACE_INFO = "xilinx.com:interface:aximm:1.0 AXI_LITE_TIMER BRESP" *)
output wire [1 : 0] AXI_LITE_TIMER_bresp;
(* X_INTERFACE_INFO = "xilinx.com:interface:aximm:1.0 AXI_LITE_TIMER BVALID" *)
output wire AXI_LITE_TIMER_bvalid;
(* X_INTERFACE_INFO = "xilinx.com:interface:aximm:1.0 AXI_LITE_TIMER RDATA" *)
output wire [31 : 0] AXI_LITE_TIMER_rdata;
(* X_INTERFACE_INFO = "xilinx.com:interface:aximm:1.0 AXI_LITE_TIMER RREADY" *)
input wire AXI_LITE_TIMER_rready;
(* X_INTERFACE_INFO = "xilinx.com:interface:aximm:1.0 AXI_LITE_TIMER RRESP" *)
output wire [1 : 0] AXI_LITE_TIMER_rresp;
(* X_INTERFACE_INFO = "xilinx.com:interface:aximm:1.0 AXI_LITE_TIMER RVALID" *)
output wire AXI_LITE_TIMER_rvalid;
(* X_INTERFACE_INFO = "xilinx.com:interface:aximm:1.0 AXI_LITE_TIMER WDATA" *)
input wire [31 : 0] AXI_LITE_TIMER_wdata;
(* X_INTERFACE_INFO = "xilinx.com:interface:aximm:1.0 AXI_LITE_TIMER WREADY" *)
output wire AXI_LITE_TIMER_wready;
(* X_INTERFACE_INFO = "xilinx.com:interface:aximm:1.0 AXI_LITE_TIMER WSTRB" *)
input wire [3 : 0] AXI_LITE_TIMER_wstrb;
(* X_INTERFACE_PARAMETER = "XIL_INTERFACENAME AXI_LITE_TIMER, DATA_WIDTH 32, PROTOCOL AXI4LITE, ID_WIDTH 0, ADDR_WIDTH 5, AWUSER_WIDTH 0, ARUSER_WIDTH 0, WUSER_WIDTH 0, RUSER_WIDTH 0, BUSER_WIDTH 0, READ_WRITE_MODE READ_WRITE, HAS_BURST 0, HAS_LOCK 0, HAS_PROT 0, HAS_CACHE 0, HAS_QOS 0, HAS_REGION 0, HAS_WSTRB 1, HAS_BRESP 1, HAS_RRESP 1, SUPPORTS_NARROW_BURST 0, NUM_READ_OUTSTANDING 1, NUM_WRITE_OUTSTANDING 1, MAX_BURST_LENGTH 1, FREQ_HZ 100000000, PHASE 0.0, CLK_DOMAIN /clk_wiz_0_clk_out1, NUM_READ_THREADS 1, NUM_WRITE_T\
HREADS 1, RUSER_BITS_PER_BYTE 0, WUSER_BITS_PER_BYTE 0" *)
(* X_INTERFACE_INFO = "xilinx.com:interface:aximm:1.0 AXI_LITE_TIMER WVALID" *)
input wire AXI_LITE_TIMER_wvalid;
(* X_INTERFACE_INFO = "digilentinc.com:interface:pmod:1.0 Pmod_out PIN10_I" *)
input wire Pmod_out_pin10_i;
(* X_INTERFACE_INFO = "digilentinc.com:interface:pmod:1.0 Pmod_out PIN10_O" *)
output wire Pmod_out_pin10_o;
(* X_INTERFACE_INFO = "digilentinc.com:interface:pmod:1.0 Pmod_out PIN10_T" *)
output wire Pmod_out_pin10_t;
(* X_INTERFACE_INFO = "digilentinc.com:interface:pmod:1.0 Pmod_out PIN1_I" *)
input wire Pmod_out_pin1_i;
(* X_INTERFACE_INFO = "digilentinc.com:interface:pmod:1.0 Pmod_out PIN1_O" *)
output wire Pmod_out_pin1_o;
(* X_INTERFACE_INFO = "digilentinc.com:interface:pmod:1.0 Pmod_out PIN1_T" *)
output wire Pmod_out_pin1_t;
(* X_INTERFACE_INFO = "digilentinc.com:interface:pmod:1.0 Pmod_out PIN2_I" *)
input wire Pmod_out_pin2_i;
(* X_INTERFACE_INFO = "digilentinc.com:interface:pmod:1.0 Pmod_out PIN2_O" *)
output wire Pmod_out_pin2_o;
(* X_INTERFACE_INFO = "digilentinc.com:interface:pmod:1.0 Pmod_out PIN2_T" *)
output wire Pmod_out_pin2_t;
(* X_INTERFACE_INFO = "digilentinc.com:interface:pmod:1.0 Pmod_out PIN3_I" *)
input wire Pmod_out_pin3_i;
(* X_INTERFACE_INFO = "digilentinc.com:interface:pmod:1.0 Pmod_out PIN3_O" *)
output wire Pmod_out_pin3_o;
(* X_INTERFACE_INFO = "digilentinc.com:interface:pmod:1.0 Pmod_out PIN3_T" *)
output wire Pmod_out_pin3_t;
(* X_INTERFACE_INFO = "digilentinc.com:interface:pmod:1.0 Pmod_out PIN4_I" *)
input wire Pmod_out_pin4_i;
(* X_INTERFACE_INFO = "digilentinc.com:interface:pmod:1.0 Pmod_out PIN4_O" *)
output wire Pmod_out_pin4_o;
(* X_INTERFACE_INFO = "digilentinc.com:interface:pmod:1.0 Pmod_out PIN4_T" *)
output wire Pmod_out_pin4_t;
(* X_INTERFACE_INFO = "digilentinc.com:interface:pmod:1.0 Pmod_out PIN7_I" *)
input wire Pmod_out_pin7_i;
(* X_INTERFACE_INFO = "digilentinc.com:interface:pmod:1.0 Pmod_out PIN7_O" *)
output wire Pmod_out_pin7_o;
(* X_INTERFACE_INFO = "digilentinc.com:interface:pmod:1.0 Pmod_out PIN7_T" *)
output wire Pmod_out_pin7_t;
(* X_INTERFACE_INFO = "digilentinc.com:interface:pmod:1.0 Pmod_out PIN8_I" *)
input wire Pmod_out_pin8_i;
(* X_INTERFACE_INFO = "digilentinc.com:interface:pmod:1.0 Pmod_out PIN8_O" *)
output wire Pmod_out_pin8_o;
(* X_INTERFACE_INFO = "digilentinc.com:interface:pmod:1.0 Pmod_out PIN8_T" *)
output wire Pmod_out_pin8_t;
(* X_INTERFACE_INFO = "digilentinc.com:interface:pmod:1.0 Pmod_out PIN9_I" *)
input wire Pmod_out_pin9_i;
(* X_INTERFACE_INFO = "digilentinc.com:interface:pmod:1.0 Pmod_out PIN9_O" *)
output wire Pmod_out_pin9_o;
(* X_INTERFACE_PARAMETER = "XIL_INTERFACENAME Pmod_out, BUSIF.BOARD_INTERFACE Custom, BOARD.ASSOCIATED_PARAM PMOD" *)
(* X_INTERFACE_INFO = "digilentinc.com:interface:pmod:1.0 Pmod_out PIN9_T" *)
output wire Pmod_out_pin9_t;
(* X_INTERFACE_PARAMETER = "XIL_INTERFACENAME CLK.S_AXI_ACLK, ASSOCIATED_BUSIF AXI_LITE_PWM:AXI_LITE_GPIO:AXI_LITE_TIMER, ASSOCIATED_RESET s_axi_aresetn, FREQ_HZ 100000000, PHASE 0.0, CLK_DOMAIN /clk_wiz_0_clk_out1" *)
(* X_INTERFACE_INFO = "xilinx.com:signal:clock:1.0 CLK.S_AXI_ACLK CLK" *)
input wire s_axi_aclk;
(* X_INTERFACE_PARAMETER = "XIL_INTERFACENAME RST.S_AXI_ARESETN, POLARITY ACTIVE_LOW" *)
(* X_INTERFACE_INFO = "xilinx.com:signal:reset:1.0 RST.S_AXI_ARESETN RST" *)
input wire s_axi_aresetn;
(* X_INTERFACE_PARAMETER = "XIL_INTERFACENAME INTR.TIMER_INTERRUPT, SENSITIVITY LEVEL_HIGH, PortWidth 1, XIL_INTERFACENAME timer_interrupt, SENSITIVITY LEVEL_HIGH, PortWidth 1" *)
(* X_INTERFACE_INFO = "xilinx.com:signal:interrupt:1.0 INTR.TIMER_INTERRUPT INTERRUPT, xilinx.com:signal:interrupt:1.0 timer_interrupt INTERRUPT" *)
output wire timer_interrupt;

  PmodAMP2 inst (
    .AXI_LITE_GPIO_araddr(AXI_LITE_GPIO_araddr),
    .AXI_LITE_GPIO_arready(AXI_LITE_GPIO_arready),
    .AXI_LITE_GPIO_arvalid(AXI_LITE_GPIO_arvalid),
    .AXI_LITE_GPIO_awaddr(AXI_LITE_GPIO_awaddr),
    .AXI_LITE_GPIO_awready(AXI_LITE_GPIO_awready),
    .AXI_LITE_GPIO_awvalid(AXI_LITE_GPIO_awvalid),
    .AXI_LITE_GPIO_bready(AXI_LITE_GPIO_bready),
    .AXI_LITE_GPIO_bresp(AXI_LITE_GPIO_bresp),
    .AXI_LITE_GPIO_bvalid(AXI_LITE_GPIO_bvalid),
    .AXI_LITE_GPIO_rdata(AXI_LITE_GPIO_rdata),
    .AXI_LITE_GPIO_rready(AXI_LITE_GPIO_rready),
    .AXI_LITE_GPIO_rresp(AXI_LITE_GPIO_rresp),
    .AXI_LITE_GPIO_rvalid(AXI_LITE_GPIO_rvalid),
    .AXI_LITE_GPIO_wdata(AXI_LITE_GPIO_wdata),
    .AXI_LITE_GPIO_wready(AXI_LITE_GPIO_wready),
    .AXI_LITE_GPIO_wstrb(AXI_LITE_GPIO_wstrb),
    .AXI_LITE_GPIO_wvalid(AXI_LITE_GPIO_wvalid),
    .AXI_LITE_PWM_araddr(AXI_LITE_PWM_araddr),
    .AXI_LITE_PWM_arprot(AXI_LITE_PWM_arprot),
    .AXI_LITE_PWM_arready(AXI_LITE_PWM_arready),
    .AXI_LITE_PWM_arvalid(AXI_LITE_PWM_arvalid),
    .AXI_LITE_PWM_awaddr(AXI_LITE_PWM_awaddr),
    .AXI_LITE_PWM_awprot(AXI_LITE_PWM_awprot),
    .AXI_LITE_PWM_awready(AXI_LITE_PWM_awready),
    .AXI_LITE_PWM_awvalid(AXI_LITE_PWM_awvalid),
    .AXI_LITE_PWM_bready(AXI_LITE_PWM_bready),
    .AXI_LITE_PWM_bresp(AXI_LITE_PWM_bresp),
    .AXI_LITE_PWM_bvalid(AXI_LITE_PWM_bvalid),
    .AXI_LITE_PWM_rdata(AXI_LITE_PWM_rdata),
    .AXI_LITE_PWM_rready(AXI_LITE_PWM_rready),
    .AXI_LITE_PWM_rresp(AXI_LITE_PWM_rresp),
    .AXI_LITE_PWM_rvalid(AXI_LITE_PWM_rvalid),
    .AXI_LITE_PWM_wdata(AXI_LITE_PWM_wdata),
    .AXI_LITE_PWM_wready(AXI_LITE_PWM_wready),
    .AXI_LITE_PWM_wstrb(AXI_LITE_PWM_wstrb),
    .AXI_LITE_PWM_wvalid(AXI_LITE_PWM_wvalid),
    .AXI_LITE_TIMER_araddr(AXI_LITE_TIMER_araddr),
    .AXI_LITE_TIMER_arready(AXI_LITE_TIMER_arready),
    .AXI_LITE_TIMER_arvalid(AXI_LITE_TIMER_arvalid),
    .AXI_LITE_TIMER_awaddr(AXI_LITE_TIMER_awaddr),
    .AXI_LITE_TIMER_awready(AXI_LITE_TIMER_awready),
    .AXI_LITE_TIMER_awvalid(AXI_LITE_TIMER_awvalid),
    .AXI_LITE_TIMER_bready(AXI_LITE_TIMER_bready),
    .AXI_LITE_TIMER_bresp(AXI_LITE_TIMER_bresp),
    .AXI_LITE_TIMER_bvalid(AXI_LITE_TIMER_bvalid),
    .AXI_LITE_TIMER_rdata(AXI_LITE_TIMER_rdata),
    .AXI_LITE_TIMER_rready(AXI_LITE_TIMER_rready),
    .AXI_LITE_TIMER_rresp(AXI_LITE_TIMER_rresp),
    .AXI_LITE_TIMER_rvalid(AXI_LITE_TIMER_rvalid),
    .AXI_LITE_TIMER_wdata(AXI_LITE_TIMER_wdata),
    .AXI_LITE_TIMER_wready(AXI_LITE_TIMER_wready),
    .AXI_LITE_TIMER_wstrb(AXI_LITE_TIMER_wstrb),
    .AXI_LITE_TIMER_wvalid(AXI_LITE_TIMER_wvalid),
    .Pmod_out_pin10_i(Pmod_out_pin10_i),
    .Pmod_out_pin10_o(Pmod_out_pin10_o),
    .Pmod_out_pin10_t(Pmod_out_pin10_t),
    .Pmod_out_pin1_i(Pmod_out_pin1_i),
    .Pmod_out_pin1_o(Pmod_out_pin1_o),
    .Pmod_out_pin1_t(Pmod_out_pin1_t),
    .Pmod_out_pin2_i(Pmod_out_pin2_i),
    .Pmod_out_pin2_o(Pmod_out_pin2_o),
    .Pmod_out_pin2_t(Pmod_out_pin2_t),
    .Pmod_out_pin3_i(Pmod_out_pin3_i),
    .Pmod_out_pin3_o(Pmod_out_pin3_o),
    .Pmod_out_pin3_t(Pmod_out_pin3_t),
    .Pmod_out_pin4_i(Pmod_out_pin4_i),
    .Pmod_out_pin4_o(Pmod_out_pin4_o),
    .Pmod_out_pin4_t(Pmod_out_pin4_t),
    .Pmod_out_pin7_i(Pmod_out_pin7_i),
    .Pmod_out_pin7_o(Pmod_out_pin7_o),
    .Pmod_out_pin7_t(Pmod_out_pin7_t),
    .Pmod_out_pin8_i(Pmod_out_pin8_i),
    .Pmod_out_pin8_o(Pmod_out_pin8_o),
    .Pmod_out_pin8_t(Pmod_out_pin8_t),
    .Pmod_out_pin9_i(Pmod_out_pin9_i),
    .Pmod_out_pin9_o(Pmod_out_pin9_o),
    .Pmod_out_pin9_t(Pmod_out_pin9_t),
    .s_axi_aclk(s_axi_aclk),
    .s_axi_aresetn(s_axi_aresetn),
    .timer_interrupt(timer_interrupt)
  );
endmodule
