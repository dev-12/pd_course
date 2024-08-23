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

`ifndef SKY130_FD_SC_HD__UDP_MUX_2TO1_V
`define SKY130_FD_SC_HD__UDP_MUX_2TO1_V

/**
 * udp_mux_2to1: Two to one multiplexer
 *
 * Verilog primitive definition.
 *
 * WARNING: This file is autogenerated, do not modify directly!
 */

`timescale 1ns / 1ps
`default_nettype none

`ifdef NO_PRIMITIVES
`include "./sky130_fd_sc_hd__udp_mux_2to1.blackbox.v"
`else
primitive sky130_fd_sc_hd__udp_mux_2to1 (
    X ,
    A0,
    A1,
    S
);

    output X ;
    input  A0;
    input  A1;
    input  S ;

    table
     //  A0  A1  S  :  X
         0   0   ?  :  0   ;
         1   1   ?  :  1   ;
         0   ?   0  :  0   ;
         1   ?   0  :  1   ;
         ?   0   1  :  0   ;
         ?   1   1  :  1   ;
    endtable
endprimitive
`endif // NO_PRIMITIVES

`default_nettype wire
`endif  // SKY130_FD_SC_HD__UDP_MUX_2TO1_V
