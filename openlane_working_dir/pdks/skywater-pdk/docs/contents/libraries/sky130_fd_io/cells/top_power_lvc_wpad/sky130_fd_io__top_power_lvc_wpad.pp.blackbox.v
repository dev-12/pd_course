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

`ifndef SKY130_FD_IO__TOP_POWER_LVC_WPAD_PP_BLACKBOX_V
`define SKY130_FD_IO__TOP_POWER_LVC_WPAD_PP_BLACKBOX_V

/**
 * top_power_lvc_wpad: A power pad with an ESD low-voltage clamp.
 *
 * Verilog stub definition (black box with power pins).
 *
 * WARNING: This file is autogenerated, do not modify directly!
 */

`timescale 1ns / 1ps
`default_nettype none

(* blackbox *)
module sky130_fd_io__top_power_lvc_wpad (
           P_PAD       ,
           AMUXBUS_A   ,
           AMUXBUS_B   ,
           SRC_BDY_LVC1,
           SRC_BDY_LVC2,
           OGC_LVC     ,
           DRN_LVC1    ,
           BDY2_B2B    ,
           DRN_LVC2    ,
           P_CORE      ,
           VDDIO       ,
           VDDIO_Q     ,
           VDDA        ,
           VCCD        ,
           VSWITCH     ,
           VCCHIB      ,
           VSSA        ,
           VSSD        ,
           VSSIO_Q     ,
           VSSIO
       );

inout P_PAD       ;
inout AMUXBUS_A   ;
inout AMUXBUS_B   ;
inout SRC_BDY_LVC1;
inout SRC_BDY_LVC2;
inout OGC_LVC     ;
inout DRN_LVC1    ;
inout BDY2_B2B    ;
inout DRN_LVC2    ;
inout P_CORE      ;
inout VDDIO       ;
inout VDDIO_Q     ;
inout VDDA        ;
inout VCCD        ;
inout VSWITCH     ;
inout VCCHIB      ;
inout VSSA        ;
inout VSSD        ;
inout VSSIO_Q     ;
inout VSSIO       ;
endmodule

`default_nettype wire
`endif  // SKY130_FD_IO__TOP_POWER_LVC_WPAD_PP_BLACKBOX_V
