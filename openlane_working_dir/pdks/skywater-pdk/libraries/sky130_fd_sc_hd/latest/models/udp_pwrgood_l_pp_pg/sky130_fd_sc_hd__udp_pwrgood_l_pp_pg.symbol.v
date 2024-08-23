/**
 * Copyright 2020 The SkyWater PDK Authors
 *
 * Licensed under the Apache License, Version 2.0 (the "License");
 * you may not use this file except in compliance with the License.
 * You may obtain a copy of the License at
 *
 *     https://www.apache.org/licenses/LICENSE-2.0
 *
 * Unless required by applicable law or agreed to in writing, software
 * distributed under the License is distributed on an "AS IS" BASIS,
 * WITHOUT WARRANTIES OR CONDITIONS OF ANY KIND, either express or implied.
 * See the License for the specific language governing permissions and
 * limitations under the License.
 *
 * SPDX-License-Identifier: Apache-2.0
 */

`ifndef SKY130_FD_SC_HD__UDP_PWRGOOD_L_PP_PG_SYMBOL_V
`define SKY130_FD_SC_HD__UDP_PWRGOOD_L_PP_PG_SYMBOL_V

/**

 *   UDP_OUT :=x when VPWR!=1 or VGND!=0
 *   UDP_OUT :=UDP_IN when VPWR==1 and VGND==0
 *
 * Verilog stub (with power pins) for graphical symbol definition
 * generation.
 *
 * WARNING: This file is autogenerated, do not modify directly!
 */

`timescale 1ns / 1ps
`default_nettype none

(* blackbox *)
module sky130_fd_sc_hd__udp_pwrgood$l_pp$PG (
    //# {{data|Data Signals}}
    input  UDP_IN ,
    output UDP_OUT,

    //# {{power|Power}}
    input  VPWR   ,
    input  VGND
);
endmodule

`default_nettype wire
`endif  // SKY130_FD_SC_HD__UDP_PWRGOOD_L_PP_PG_SYMBOL_V
