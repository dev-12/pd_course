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

`ifndef SKY130_FD_SC_HD__LPFLOW_BLEEDER_TB_V
`define SKY130_FD_SC_HD__LPFLOW_BLEEDER_TB_V

/**
 * lpflow_bleeder: Current bleeder (weak pulldown to ground).
 *
 * Autogenerated test bench.
 *
 * WARNING: This file is autogenerated, do not modify directly!
 */

`timescale 1ns / 1ps
`default_nettype none

`include "sky130_fd_sc_hd__lpflow_bleeder.v"

module top();

    // Inputs are registered
    reg SHORT;
    reg VGND;
    reg VPB;
    reg VNB;

    // Outputs are wires

    initial
    begin
        // Initial state is x for all inputs.
        SHORT = 1'bX;
        VGND  = 1'bX;
        VNB   = 1'bX;
        VPB   = 1'bX;

        #20   SHORT = 1'b0;
        #40   VGND  = 1'b0;
        #60   VNB   = 1'b0;
        #80   VPB   = 1'b0;
        #100  SHORT = 1'b1;
        #120  VGND  = 1'b1;
        #140  VNB   = 1'b1;
        #160  VPB   = 1'b1;
        #180  SHORT = 1'b0;
        #200  VGND  = 1'b0;
        #220  VNB   = 1'b0;
        #240  VPB   = 1'b0;
        #260  VPB   = 1'b1;
        #280  VNB   = 1'b1;
        #300  VGND  = 1'b1;
        #320  SHORT = 1'b1;
        #340  VPB   = 1'bx;
        #360  VNB   = 1'bx;
        #380  VGND  = 1'bx;
        #400  SHORT = 1'bx;
    end

    sky130_fd_sc_hd__lpflow_bleeder dut (.SHORT(SHORT), .VGND(VGND), .VPB(VPB), .VNB(VNB));

endmodule

`default_nettype wire
`endif  // SKY130_FD_SC_HD__LPFLOW_BLEEDER_TB_V
