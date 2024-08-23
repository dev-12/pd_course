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

`ifndef SKY130_FD_SC_HD__UDP_DFF_NSR_V
`define SKY130_FD_SC_HD__UDP_DFF_NSR_V

/**
 * udp_dff$NSR: Negative edge triggered D flip-flop (Q output UDP)
 *              with both active high reset and set (set dominate).
 *
 * Verilog primitive definition.
 *
 * WARNING: This file is autogenerated, do not modify directly!
 */

`timescale 1ns / 1ps
`default_nettype none

`ifdef NO_PRIMITIVES
`include "./sky130_fd_sc_hd__udp_dff_nsr.blackbox.v"
`else
primitive sky130_fd_sc_hd__udp_dff$NSR (
    Q    ,
    SET  ,
    RESET,
    CLK_N,
    D
);

    output Q    ;
    input  SET  ;
    input  RESET;
    input  CLK_N;
    input  D    ;

    reg Q;

    table
     // SET RESET CLK_N  D  :  Qt : Qt+1
         0    1     ?    ?  :  ?  :  0    ; // Asserting reset
         0    *     ?    ?  :  0  :  0    ; // Changing reset
         1    ?     ?    ?  :  ?  :  1    ; // Asserting set (dominates reset)
         *    0     ?    ?  :  1  :  1    ; // Changing set
         0    ?    (01)  0  :  ?  :  0    ; // rising clock
         ?    0    (01)  1  :  ?  :  1    ; // rising clock
         0    ?     p    0  :  0  :  0    ; // potential rising clock
         ?    0     p    1  :  1  :  1    ; // potential rising clock
         0    0     n    ?  :  ?  :  -    ; // Clock falling register output does not change
         0    0     ?    *  :  ?  :  -    ; // Changing Data
    endtable
endprimitive
`endif // NO_PRIMITIVES

`default_nettype wire
`endif  // SKY130_FD_SC_HD__UDP_DFF_NSR_V
