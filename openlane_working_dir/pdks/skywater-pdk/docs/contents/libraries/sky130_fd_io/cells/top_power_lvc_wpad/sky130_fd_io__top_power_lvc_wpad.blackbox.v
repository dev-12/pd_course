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

`ifndef SKY130_FD_IO__TOP_POWER_LVC_WPAD_BLACKBOX_V
`define SKY130_FD_IO__TOP_POWER_LVC_WPAD_BLACKBOX_V

/**
 * top_power_lvc_wpad: A power pad with an ESD low-voltage clamp.
 *
 * Verilog stub definition (black box without power pins).
 *
 * WARNING: This file is autogenerated, do not modify directly!
 */

`timescale 1ns / 1ps
`default_nettype none

(* blackbox *)
module sky130_fd_io__top_power_lvc_wpad (
           P_PAD    ,
           AMUXBUS_A,
           AMUXBUS_B
       );

inout P_PAD    ;
inout AMUXBUS_A;
inout AMUXBUS_B;

// Voltage supply signals
supply0 SRC_BDY_LVC1;
supply0 SRC_BDY_LVC2;
supply1 OGC_LVC     ;
supply1 DRN_LVC1    ;
supply1 BDY2_B2B    ;
supply0 DRN_LVC2    ;
supply1 P_CORE      ;
supply1 VDDIO       ;
supply1 VDDIO_Q     ;
supply1 VDDA        ;
supply1 VCCD        ;
supply1 VSWITCH     ;
supply1 VCCHIB      ;
supply0 VSSA        ;
supply0 VSSD        ;
supply0 VSSIO_Q     ;
supply0 VSSIO       ;

endmodule

`default_nettype wire
`endif  // SKY130_FD_IO__TOP_POWER_LVC_WPAD_BLACKBOX_V
