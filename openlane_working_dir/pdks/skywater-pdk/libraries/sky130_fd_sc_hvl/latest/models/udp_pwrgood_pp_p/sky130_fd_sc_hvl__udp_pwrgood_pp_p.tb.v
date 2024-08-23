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

`ifndef SKY130_FD_SC_HVL__UDP_PWRGOOD_PP_P_TB_V
`define SKY130_FD_SC_HVL__UDP_PWRGOOD_PP_P_TB_V

/**

 *   UDP_OUT :=x when VPWR!=1
 *   UDP_OUT :=UDP_IN when VPWR==1
 *
 * Autogenerated test bench.
 *
 * WARNING: This file is autogenerated, do not modify directly!
 */

`timescale 1ns / 1ps
`default_nettype none

`include "sky130_fd_sc_hvl__udp_pwrgood_pp_p.v"

module top();

    // Inputs are registered
    reg UDP_IN;
    reg VPWR;

    // Outputs are wires
    wire UDP_OUT;

    initial
    begin
        // Initial state is x for all inputs.
        UDP_IN = 1'bX;
        VPWR   = 1'bX;

        #20   UDP_IN = 1'b0;
        #40   VPWR   = 1'b0;
        #60   UDP_IN = 1'b1;
        #80   VPWR   = 1'b1;
        #100  UDP_IN = 1'b0;
        #120  VPWR   = 1'b0;
        #140  VPWR   = 1'b1;
        #160  UDP_IN = 1'b1;
        #180  VPWR   = 1'bx;
        #200  UDP_IN = 1'bx;
    end

    sky130_fd_sc_hvl__udp_pwrgood_pp$P dut (.UDP_IN(UDP_IN), .VPWR(VPWR), .UDP_OUT(UDP_OUT));

endmodule

`default_nettype wire
`endif  // SKY130_FD_SC_HVL__UDP_PWRGOOD_PP_P_TB_V
