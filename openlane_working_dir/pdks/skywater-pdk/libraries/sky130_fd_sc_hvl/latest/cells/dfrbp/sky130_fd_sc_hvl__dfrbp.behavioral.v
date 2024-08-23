/*
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


`ifndef SKY130_FD_SC_HVL__DFRBP_BEHAVIORAL_V
`define SKY130_FD_SC_HVL__DFRBP_BEHAVIORAL_V

/**
 * dfrbp: Delay flop, inverted reset, complementary outputs.
 *
 * Verilog simulation functional model.
 */

`timescale 1ns / 1ps
`default_nettype none

// Import user defined primitives.
`include "../../models/udp_dff_pr_pp_pg_n/sky130_fd_sc_hvl__udp_dff_pr_pp_pg_n.v"

`celldefine
module sky130_fd_sc_hvl__dfrbp (
    Q      ,
    Q_N    ,
    CLK    ,
    D      ,
    RESET_B
);

    // Module ports
    output Q      ;
    output Q_N    ;
    input  CLK    ;
    input  D      ;
    input  RESET_B;

    // Module supplies
    supply1 VPWR;
    supply0 VGND;
    supply1 VPB ;
    supply0 VNB ;

    // Local signals
    wire buf_Q          ;
    wire RESET          ;
    reg  notifier       ;
    wire cond0          ;
    wire D_delayed      ;
    wire RESET_B_delayed;
    wire CLK_delayed    ;

    //                                   Name  Output  Other arguments
    not                                  not0 (RESET , RESET_B_delayed                                    );
    sky130_fd_sc_hvl__udp_dff$PR_pp$PG$N dff0 (buf_Q , D_delayed, CLK_delayed, RESET, notifier, VPWR, VGND);
    assign cond0 = ( RESET_B_delayed === 1'b1 );
    buf                                  buf0 (Q     , buf_Q                                              );
    not                                  not1 (Q_N   , buf_Q                                              );

endmodule
`endcelldefine

`default_nettype wire
`endif  // SKY130_FD_SC_HVL__DFRBP_BEHAVIORAL_V