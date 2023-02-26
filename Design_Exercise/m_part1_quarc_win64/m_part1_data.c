/*
 * m_part1_data.c
 *
 * Academic License - for use in teaching, academic research, and meeting
 * course requirements at degree granting institutions only.  Not for
 * government, commercial, or other organizational use.
 *
 * Code generation for model "m_part1".
 *
 * Model version              : 5.8
 * Simulink Coder version : 9.5 (R2021a) 14-Nov-2020
 * C source code generated on : Fri Feb 17 14:42:59 2023
 *
 * Target selection: quarc_win64.tlc
 * Note: GRT includes extra infrastructure and instrumentation for prototyping
 * Embedded hardware selection: Intel->x86-64 (Windows64)
 * Code generation objectives: Unspecified
 * Validation result: Not run
 */

#include "m_part1.h"
#include "m_part1_private.h"

/* Block parameters (default storage) */
P_m_part1_T m_part1_P = {
  /* Mask Parameter: HILWriteAnalog_channels
   * Referenced by: '<S3>/HIL Write Analog'
   */
  { 0U, 1U, 2U, 3U },

  /* Expression: set_other_outputs_at_terminate
   * Referenced by: '<S3>/HIL Initialize'
   */
  0.0,

  /* Expression: set_other_outputs_at_switch_out
   * Referenced by: '<S3>/HIL Initialize'
   */
  0.0,

  /* Expression: set_other_outputs_at_start
   * Referenced by: '<S3>/HIL Initialize'
   */
  0.0,

  /* Expression: set_other_outputs_at_switch_in
   * Referenced by: '<S3>/HIL Initialize'
   */
  0.0,

  /* Expression: final_analog_outputs
   * Referenced by: '<S3>/HIL Initialize'
   */
  0.0,

  /* Expression: final_pwm_outputs
   * Referenced by: '<S3>/HIL Initialize'
   */
  0.0,

  /* Expression: analog_input_maximums
   * Referenced by: '<S3>/HIL Initialize'
   */
  10.0,

  /* Expression: analog_input_minimums
   * Referenced by: '<S3>/HIL Initialize'
   */
  -10.0,

  /* Expression: analog_output_maximums
   * Referenced by: '<S3>/HIL Initialize'
   */
  10.0,

  /* Expression: analog_output_minimums
   * Referenced by: '<S3>/HIL Initialize'
   */
  -10.0,

  /* Expression: initial_analog_outputs
   * Referenced by: '<S3>/HIL Initialize'
   */
  0.0,

  /* Expression: watchdog_analog_outputs
   * Referenced by: '<S3>/HIL Initialize'
   */
  0.0,

  /* Expression: pwm_frequency
   * Referenced by: '<S3>/HIL Initialize'
   */
  24305.934065934067,

  /* Expression: pwm_leading_deadband
   * Referenced by: '<S3>/HIL Initialize'
   */
  0.0,

  /* Expression: pwm_trailing_deadband
   * Referenced by: '<S3>/HIL Initialize'
   */
  0.0,

  /* Expression: initial_pwm_outputs
   * Referenced by: '<S3>/HIL Initialize'
   */
  0.0,

  /* Expression: watchdog_pwm_outputs
   * Referenced by: '<S3>/HIL Initialize'
   */
  0.0,

  /* Expression: -0.0015
   * Referenced by: '<S3>/Encoder Resolution: Elevation (rad//count)'
   */
  -0.0015,

  /* Expression: 0.0015
   * Referenced by: '<S3>/Encoder Resolution: Pitch (rad//count)'
   */
  0.0015,

  /* Expression: 7.6699e-4
   * Referenced by: '<S3>/Encoder Resolution: Travel (rad//count)'
   */
  0.00076699,

  /* Expression: 0
   * Referenced by: '<S5>/Integrator'
   */
  0.0,

  /* Expression: 5
   * Referenced by: '<S5>/Integrator'
   */
  5.0,

  /* Expression: -5
   * Referenced by: '<S5>/Integrator'
   */
  -5.0,

  /* Expression: 0
   * Referenced by: '<S6>/Integrator'
   */
  0.0,

  /* Expression: 90
   * Referenced by: '<S6>/Integrator'
   */
  90.0,

  /* Expression: -90
   * Referenced by: '<S6>/Integrator'
   */
  -90.0,

  /* Computed Parameter: TravelLowpass_A
   * Referenced by: '<S1>/Travel  Low pass'
   */
  -50.0,

  /* Computed Parameter: TravelLowpass_C
   * Referenced by: '<S1>/Travel  Low pass'
   */
  50.0,

  /* Expression: 0
   * Referenced by: '<Root>/Yaw Demand NEED TO CHANGE THIS VALUE TO ONE THAT SETS QUANSER NEXT TO YOU'
   */
  0.0,

  /* Expression: 0.8632
   * Referenced by: '<S6>/K_tp'
   */
  0.8632,

  /* Expression: 90
   * Referenced by: '<S6>/Saturation'
   */
  90.0,

  /* Expression: -90
   * Referenced by: '<S6>/Saturation'
   */
  -90.0,

  /* Expression: 180/pi
   * Referenced by: '<S1>/Gain2'
   */
  57.295779513082323,

  /* Computed Parameter: TravelDeriv2_A
   * Referenced by: '<S1>/Travel Deriv2'
   */
  -20.0,

  /* Computed Parameter: TravelDeriv2_C
   * Referenced by: '<S1>/Travel Deriv2'
   */
  -400.0,

  /* Computed Parameter: TravelDeriv2_D
   * Referenced by: '<S1>/Travel Deriv2'
   */
  20.0,

  /* Expression: 2.2668
   * Referenced by: '<S6>/K_td'
   */
  2.2668,

  /* Expression: 40
   * Referenced by: '<S6>/P cmd'
   */
  40.0,

  /* Expression: -40
   * Referenced by: '<S6>/P cmd'
   */
  -40.0,

  /* Expression: 180/pi
   * Referenced by: '<S1>/Gain1'
   */
  57.295779513082323,

  /* Expression: -0.3176
   * Referenced by: '<S5>/K_pp'
   */
  -0.3176,

  /* Computed Parameter: TravelDeriv1_A
   * Referenced by: '<S1>/Travel Deriv1'
   */
  -20.0,

  /* Computed Parameter: TravelDeriv1_C
   * Referenced by: '<S1>/Travel Deriv1'
   */
  -400.0,

  /* Computed Parameter: TravelDeriv1_D
   * Referenced by: '<S1>/Travel Deriv1'
   */
  20.0,

  /* Expression: -0.2
   * Referenced by: '<S5>/K_pd'
   */
  -0.2,

  /* Expression: 25
   * Referenced by: '<S1>/Saturation1'
   */
  25.0,

  /* Expression: -25
   * Referenced by: '<S1>/Saturation1'
   */
  -25.0,

  /* Expression: 18
   * Referenced by: '<Root>/Elev offset DO NOT TOUCH'
   */
  18.0,

  /* Expression: 0
   * Referenced by: '<Root>/Elevation Input THIS IS THE VALUE YOU CHANGE TO APPLY  STEP INPUTSTO THE MOTORS'
   */
  0.0,

  /* Expression: 25
   * Referenced by: '<S1>/Saturation'
   */
  25.0,

  /* Expression: -25
   * Referenced by: '<S1>/Saturation'
   */
  -25.0,

  /* Expression: 0.5
   * Referenced by: '<S4>/Front'
   */
  0.5,

  /* Expression: 0.5
   * Referenced by: '<S4>/Back'
   */
  0.5,

  /* Expression: 24
   * Referenced by: '<S3>/UPM Voltage  Limit (V)'
   */
  24.0,

  /* Expression: -24
   * Referenced by: '<S3>/UPM Voltage  Limit (V)'
   */
  -24.0,

  /* Expression:  1 / 3
   * Referenced by: '<S3>/Cable Gain Pre-Compensation'
   */
  0.33333333333333331,

  /* Expression: 10
   * Referenced by: '<S3>/DACB Limit (V)'
   */
  10.0,

  /* Expression: -10
   * Referenced by: '<S3>/DACB Limit (V)'
   */
  -10.0,

  /* Expression: 180/pi
   * Referenced by: '<S1>/Gain'
   */
  57.295779513082323,

  /* Computed Parameter: TravelDeriv_A
   * Referenced by: '<S1>/Travel Deriv'
   */
  -20.0,

  /* Computed Parameter: TravelDeriv_C
   * Referenced by: '<S1>/Travel Deriv'
   */
  -400.0,

  /* Computed Parameter: TravelDeriv_D
   * Referenced by: '<S1>/Travel Deriv'
   */
  20.0,

  /* Expression: 0
   * Referenced by: '<S5>/K_pi'
   */
  0.0,

  /* Expression: 0.1105
   * Referenced by: '<S6>/K_ti'
   */
  0.1105,

  /* Computed Parameter: HILInitialize_CKChannels
   * Referenced by: '<S3>/HIL Initialize'
   */
  { 0, 1, 2 },

  /* Computed Parameter: HILInitialize_DOWatchdog
   * Referenced by: '<S3>/HIL Initialize'
   */
  1,

  /* Computed Parameter: HILInitialize_EIInitial
   * Referenced by: '<S3>/HIL Initialize'
   */
  0,

  /* Computed Parameter: HILInitialize_POModes
   * Referenced by: '<S3>/HIL Initialize'
   */
  0,

  /* Computed Parameter: HILInitialize_POConfiguration
   * Referenced by: '<S3>/HIL Initialize'
   */
  0,

  /* Computed Parameter: HILInitialize_POAlignment
   * Referenced by: '<S3>/HIL Initialize'
   */
  0,

  /* Computed Parameter: HILInitialize_POPolarity
   * Referenced by: '<S3>/HIL Initialize'
   */
  1,

  /* Computed Parameter: HILReadEncoderTimebase_Clock
   * Referenced by: '<S3>/HIL Read Encoder Timebase'
   */
  0,

  /* Computed Parameter: HILInitialize_AIChannels
   * Referenced by: '<S3>/HIL Initialize'
   */
  { 0U, 1U, 2U, 3U, 4U, 5U, 6U, 7U },

  /* Computed Parameter: HILInitialize_AOChannels
   * Referenced by: '<S3>/HIL Initialize'
   */
  { 0U, 1U, 2U, 3U, 4U, 5U, 6U, 7U },

  /* Computed Parameter: HILInitialize_EIChannels
   * Referenced by: '<S3>/HIL Initialize'
   */
  { 0U, 1U, 2U, 3U, 4U, 5U, 6U, 7U },

  /* Computed Parameter: HILInitialize_EIQuadrature
   * Referenced by: '<S3>/HIL Initialize'
   */
  4U,

  /* Computed Parameter: HILInitialize_POChannels
   * Referenced by: '<S3>/HIL Initialize'
   */
  { 0U, 1U, 2U, 3U, 4U, 5U, 6U, 7U },

  /* Computed Parameter: HILReadEncoderTimebase_Channels
   * Referenced by: '<S3>/HIL Read Encoder Timebase'
   */
  { 0U, 1U, 2U },

  /* Computed Parameter: HILReadEncoderTimebase_SamplesI
   * Referenced by: '<S3>/HIL Read Encoder Timebase'
   */
  1000U,

  /* Computed Parameter: HILInitialize_Active
   * Referenced by: '<S3>/HIL Initialize'
   */
  true,

  /* Computed Parameter: HILInitialize_AOTerminate
   * Referenced by: '<S3>/HIL Initialize'
   */
  true,

  /* Computed Parameter: HILInitialize_AOExit
   * Referenced by: '<S3>/HIL Initialize'
   */
  false,

  /* Computed Parameter: HILInitialize_DOTerminate
   * Referenced by: '<S3>/HIL Initialize'
   */
  true,

  /* Computed Parameter: HILInitialize_DOExit
   * Referenced by: '<S3>/HIL Initialize'
   */
  false,

  /* Computed Parameter: HILInitialize_POTerminate
   * Referenced by: '<S3>/HIL Initialize'
   */
  true,

  /* Computed Parameter: HILInitialize_POExit
   * Referenced by: '<S3>/HIL Initialize'
   */
  false,

  /* Computed Parameter: HILInitialize_CKPStart
   * Referenced by: '<S3>/HIL Initialize'
   */
  false,

  /* Computed Parameter: HILInitialize_CKPEnter
   * Referenced by: '<S3>/HIL Initialize'
   */
  false,

  /* Computed Parameter: HILInitialize_CKStart
   * Referenced by: '<S3>/HIL Initialize'
   */
  false,

  /* Computed Parameter: HILInitialize_CKEnter
   * Referenced by: '<S3>/HIL Initialize'
   */
  false,

  /* Computed Parameter: HILInitialize_AIPStart
   * Referenced by: '<S3>/HIL Initialize'
   */
  true,

  /* Computed Parameter: HILInitialize_AIPEnter
   * Referenced by: '<S3>/HIL Initialize'
   */
  false,

  /* Computed Parameter: HILInitialize_AOPStart
   * Referenced by: '<S3>/HIL Initialize'
   */
  true,

  /* Computed Parameter: HILInitialize_AOPEnter
   * Referenced by: '<S3>/HIL Initialize'
   */
  false,

  /* Computed Parameter: HILInitialize_AOStart
   * Referenced by: '<S3>/HIL Initialize'
   */
  true,

  /* Computed Parameter: HILInitialize_AOEnter
   * Referenced by: '<S3>/HIL Initialize'
   */
  false,

  /* Computed Parameter: HILInitialize_AOReset
   * Referenced by: '<S3>/HIL Initialize'
   */
  false,

  /* Computed Parameter: HILInitialize_DOPStart
   * Referenced by: '<S3>/HIL Initialize'
   */
  false,

  /* Computed Parameter: HILInitialize_DOPEnter
   * Referenced by: '<S3>/HIL Initialize'
   */
  false,

  /* Computed Parameter: HILInitialize_DOStart
   * Referenced by: '<S3>/HIL Initialize'
   */
  true,

  /* Computed Parameter: HILInitialize_DOEnter
   * Referenced by: '<S3>/HIL Initialize'
   */
  false,

  /* Computed Parameter: HILInitialize_DOReset
   * Referenced by: '<S3>/HIL Initialize'
   */
  false,

  /* Computed Parameter: HILInitialize_EIPStart
   * Referenced by: '<S3>/HIL Initialize'
   */
  true,

  /* Computed Parameter: HILInitialize_EIPEnter
   * Referenced by: '<S3>/HIL Initialize'
   */
  false,

  /* Computed Parameter: HILInitialize_EIStart
   * Referenced by: '<S3>/HIL Initialize'
   */
  true,

  /* Computed Parameter: HILInitialize_EIEnter
   * Referenced by: '<S3>/HIL Initialize'
   */
  false,

  /* Computed Parameter: HILInitialize_POPStart
   * Referenced by: '<S3>/HIL Initialize'
   */
  true,

  /* Computed Parameter: HILInitialize_POPEnter
   * Referenced by: '<S3>/HIL Initialize'
   */
  false,

  /* Computed Parameter: HILInitialize_POStart
   * Referenced by: '<S3>/HIL Initialize'
   */
  true,

  /* Computed Parameter: HILInitialize_POEnter
   * Referenced by: '<S3>/HIL Initialize'
   */
  false,

  /* Computed Parameter: HILInitialize_POReset
   * Referenced by: '<S3>/HIL Initialize'
   */
  false,

  /* Computed Parameter: HILInitialize_OOReset
   * Referenced by: '<S3>/HIL Initialize'
   */
  false,

  /* Computed Parameter: HILInitialize_DOFinal
   * Referenced by: '<S3>/HIL Initialize'
   */
  true,

  /* Computed Parameter: HILInitialize_DOInitial
   * Referenced by: '<S3>/HIL Initialize'
   */
  true,

  /* Computed Parameter: HILReadEncoderTimebase_Active
   * Referenced by: '<S3>/HIL Read Encoder Timebase'
   */
  true,

  /* Computed Parameter: HILWriteAnalog_Active
   * Referenced by: '<S3>/HIL Write Analog'
   */
  false,

  /* Computed Parameter: HILReadEncoderTimebase_Overflow
   * Referenced by: '<S3>/HIL Read Encoder Timebase'
   */
  1U
};
