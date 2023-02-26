/*
 * m_part1.c
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
#include "m_part1_dt.h"

/* Block signals (default storage) */
B_m_part1_T m_part1_B;

/* Continuous states */
X_m_part1_T m_part1_X;

/* Block states (default storage) */
DW_m_part1_T m_part1_DW;

/* Real-time model */
static RT_MODEL_m_part1_T m_part1_M_;
RT_MODEL_m_part1_T *const m_part1_M = &m_part1_M_;

/*
 * This function updates continuous states using the ODE1 fixed-step
 * solver algorithm
 */
static void rt_ertODEUpdateContinuousStates(RTWSolverInfo *si )
{
  time_T tnew = rtsiGetSolverStopTime(si);
  time_T h = rtsiGetStepSize(si);
  real_T *x = rtsiGetContStates(si);
  ODE1_IntgData *id = (ODE1_IntgData *)rtsiGetSolverData(si);
  real_T *f0 = id->f[0];
  int_T i;
  int_T nXc = 6;
  rtsiSetSimTimeStep(si,MINOR_TIME_STEP);
  rtsiSetdX(si, f0);
  m_part1_derivatives();
  rtsiSetT(si, tnew);
  for (i = 0; i < nXc; ++i) {
    x[i] += h * f0[i];
  }

  rtsiSetSimTimeStep(si,MAJOR_TIME_STEP);
}

/* Model output function */
void m_part1_output(void)
{
  /* local block i/o variables */
  real_T rtb_HILReadEncoderTimebase[3];
  real_T rtb_EncoderResolutionElevationr;
  real_T rtb_EncoderResolutionPitchradco;
  real_T rtb_Front;
  real_T rtb_Sum1;
  real_T rtb_TravelError;
  real_T u0;
  if (rtmIsMajorTimeStep(m_part1_M)) {
    /* set solver stop time */
    if (!(m_part1_M->Timing.clockTick0+1)) {
      rtsiSetSolverStopTime(&m_part1_M->solverInfo,
                            ((m_part1_M->Timing.clockTickH0 + 1) *
        m_part1_M->Timing.stepSize0 * 4294967296.0));
    } else {
      rtsiSetSolverStopTime(&m_part1_M->solverInfo,
                            ((m_part1_M->Timing.clockTick0 + 1) *
        m_part1_M->Timing.stepSize0 + m_part1_M->Timing.clockTickH0 *
        m_part1_M->Timing.stepSize0 * 4294967296.0));
    }
  }                                    /* end MajorTimeStep */

  /* Update absolute time of base rate at minor time step */
  if (rtmIsMinorTimeStep(m_part1_M)) {
    m_part1_M->Timing.t[0] = rtsiGetT(&m_part1_M->solverInfo);
  }

  if (rtmIsMajorTimeStep(m_part1_M)) {
    /* S-Function (hil_read_encoder_timebase_block): '<S3>/HIL Read Encoder Timebase' */

    /* S-Function Block: m_part1/Subsystem/3-DOF Helicopter IO/HIL Read Encoder Timebase (hil_read_encoder_timebase_block) */
    {
      t_error result;
      result = hil_task_read_encoder(m_part1_DW.HILReadEncoderTimebase_Task, 1,
        &m_part1_DW.HILReadEncoderTimebase_Buffer[0]);
      if (result < 0) {
        rtb_HILReadEncoderTimebase[0] = 0;
        rtb_HILReadEncoderTimebase[1] = 0;
        rtb_HILReadEncoderTimebase[2] = 0;
        msg_get_error_messageA(NULL, result, _rt_error_message, sizeof
          (_rt_error_message));
        rtmSetErrorStatus(m_part1_M, _rt_error_message);
      } else {
        rtb_HILReadEncoderTimebase[0] =
          m_part1_DW.HILReadEncoderTimebase_Buffer[0];
        rtb_HILReadEncoderTimebase[1] =
          m_part1_DW.HILReadEncoderTimebase_Buffer[1];
        rtb_HILReadEncoderTimebase[2] =
          m_part1_DW.HILReadEncoderTimebase_Buffer[2];
      }
    }

    /* Gain: '<S3>/Encoder Resolution: Elevation (rad//count)' */
    rtb_EncoderResolutionElevationr = m_part1_P.EncoderResolutionElevationradco *
      rtb_HILReadEncoderTimebase[2];

    /* Gain: '<S3>/Encoder Resolution: Pitch (rad//count)' */
    rtb_EncoderResolutionPitchradco = m_part1_P.EncoderResolutionPitchradcount_ *
      rtb_HILReadEncoderTimebase[1];

    /* Gain: '<S3>/Encoder Resolution: Travel (rad//count)' */
    rtb_Sum1 = m_part1_P.EncoderResolutionTravelradcount *
      rtb_HILReadEncoderTimebase[0];
  }

  /* Integrator: '<S5>/Integrator' */
  /* Limited  Integrator  */
  if (m_part1_X.Integrator_CSTATE >= m_part1_P.Integrator_UpperSat) {
    m_part1_X.Integrator_CSTATE = m_part1_P.Integrator_UpperSat;
  } else if (m_part1_X.Integrator_CSTATE <= m_part1_P.Integrator_LowerSat) {
    m_part1_X.Integrator_CSTATE = m_part1_P.Integrator_LowerSat;
  }

  /* Integrator: '<S6>/Integrator' */
  /* Limited  Integrator  */
  if (m_part1_X.Integrator_CSTATE_p >= m_part1_P.Integrator_UpperSat_i) {
    m_part1_X.Integrator_CSTATE_p = m_part1_P.Integrator_UpperSat_i;
  } else if (m_part1_X.Integrator_CSTATE_p <= m_part1_P.Integrator_LowerSat_o) {
    m_part1_X.Integrator_CSTATE_p = m_part1_P.Integrator_LowerSat_o;
  }

  /* TransferFcn: '<S1>/Travel  Low pass' */
  m_part1_B.TravelLowpass = 0.0;
  m_part1_B.TravelLowpass += m_part1_P.TravelLowpass_C *
    m_part1_X.TravelLowpass_CSTATE;

  /* Sum: '<S2>/Sum1' incorporates:
   *  Constant: '<Root>/Yaw Demand NEED TO CHANGE THIS VALUE TO ONE THAT SETS QUANSER NEXT TO YOU'
   */
  rtb_TravelError = m_part1_B.TravelLowpass -
    m_part1_P.YawDemandNEEDTOCHANGETHISVALUET;
  if (rtmIsMajorTimeStep(m_part1_M)) {
    /* Gain: '<S1>/Gain2' */
    m_part1_B.Gain2 = m_part1_P.Gain2_Gain * rtb_Sum1;

    /* Gain: '<S1>/Gain1' */
    m_part1_B.Gain1 = m_part1_P.Gain1_Gain * rtb_EncoderResolutionPitchradco;
  }

  /* Gain: '<S6>/K_tp' */
  u0 = m_part1_P.K_tp_Gain * rtb_TravelError;

  /* Saturate: '<S6>/Saturation' */
  if (u0 > m_part1_P.Saturation_UpperSat) {
    u0 = m_part1_P.Saturation_UpperSat;
  } else if (u0 < m_part1_P.Saturation_LowerSat) {
    u0 = m_part1_P.Saturation_LowerSat;
  }

  /* End of Saturate: '<S6>/Saturation' */

  /* Sum: '<S6>/Sum' incorporates:
   *  Gain: '<S6>/K_td'
   *  Integrator: '<S6>/Integrator'
   *  TransferFcn: '<S1>/Travel Deriv2'
   */
  u0 = (m_part1_P.TravelDeriv2_C * m_part1_X.TravelDeriv2_CSTATE +
        m_part1_P.TravelDeriv2_D * m_part1_B.Gain2) * m_part1_P.K_td_Gain +
    (m_part1_X.Integrator_CSTATE_p + u0);

  /* Saturate: '<S6>/P cmd' */
  if (u0 > m_part1_P.Pcmd_UpperSat) {
    u0 = m_part1_P.Pcmd_UpperSat;
  } else if (u0 < m_part1_P.Pcmd_LowerSat) {
    u0 = m_part1_P.Pcmd_LowerSat;
  }

  /* End of Saturate: '<S6>/P cmd' */

  /* Sum: '<S2>/Sum2' */
  rtb_EncoderResolutionPitchradco = m_part1_B.Gain1 - u0;

  /* Sum: '<S5>/Sum' incorporates:
   *  Gain: '<S5>/K_pd'
   *  Gain: '<S5>/K_pp'
   *  Integrator: '<S5>/Integrator'
   *  TransferFcn: '<S1>/Travel Deriv1'
   */
  rtb_Sum1 = (m_part1_P.TravelDeriv1_C * m_part1_X.TravelDeriv1_CSTATE +
              m_part1_P.TravelDeriv1_D * m_part1_B.Gain1) * m_part1_P.K_pd_Gain
    + (m_part1_P.K_pp_Gain * rtb_EncoderResolutionPitchradco +
       m_part1_X.Integrator_CSTATE);

  /* Saturate: '<S1>/Saturation1' */
  if (rtb_Sum1 > m_part1_P.Saturation1_UpperSat) {
    rtb_Sum1 = m_part1_P.Saturation1_UpperSat;
  } else if (rtb_Sum1 < m_part1_P.Saturation1_LowerSat) {
    rtb_Sum1 = m_part1_P.Saturation1_LowerSat;
  }

  /* End of Saturate: '<S1>/Saturation1' */
  if (rtmIsMajorTimeStep(m_part1_M)) {
    /* Constant: '<Root>/Elevation Input THIS IS THE VALUE YOU CHANGE TO APPLY  STEP INPUTSTO THE MOTORS' */
    m_part1_B.ElevationInputTHISISTHEVALUEYOU =
      m_part1_P.ElevationInputTHISISTHEVALUEYOU;

    /* Sum: '<Root>/Sum1' incorporates:
     *  Constant: '<Root>/Elev offset DO NOT TOUCH'
     */
    u0 = m_part1_P.ElevoffsetDONOTTOUCH_Value +
      m_part1_B.ElevationInputTHISISTHEVALUEYOU;

    /* Saturate: '<S1>/Saturation' */
    if (u0 > m_part1_P.Saturation_UpperSat_n) {
      /* Saturate: '<S1>/Saturation' */
      m_part1_B.Saturation = m_part1_P.Saturation_UpperSat_n;
    } else if (u0 < m_part1_P.Saturation_LowerSat_n) {
      /* Saturate: '<S1>/Saturation' */
      m_part1_B.Saturation = m_part1_P.Saturation_LowerSat_n;
    } else {
      /* Saturate: '<S1>/Saturation' */
      m_part1_B.Saturation = u0;
    }

    /* End of Saturate: '<S1>/Saturation' */
  }

  /* Gain: '<S4>/Front' incorporates:
   *  Sum: '<S4>/Sum3'
   */
  rtb_Front = (rtb_Sum1 + m_part1_B.Saturation) * m_part1_P.Front_Gain;

  /* Gain: '<S4>/Back' incorporates:
   *  Sum: '<S4>/Sum4'
   */
  rtb_Sum1 = (m_part1_B.Saturation - rtb_Sum1) * m_part1_P.Back_Gain;

  /* Saturate: '<S3>/UPM Voltage  Limit (V)' */
  if (rtb_Front > m_part1_P.UPMVoltageLimitV_UpperSat) {
    u0 = m_part1_P.UPMVoltageLimitV_UpperSat;
  } else if (rtb_Front < m_part1_P.UPMVoltageLimitV_LowerSat) {
    u0 = m_part1_P.UPMVoltageLimitV_LowerSat;
  } else {
    u0 = rtb_Front;
  }

  /* Gain: '<S3>/Cable Gain Pre-Compensation' */
  u0 *= m_part1_P.CableGainPreCompensation_Gain;

  /* Saturate: '<S3>/DACB Limit (V)' */
  if (u0 > m_part1_P.DACBLimitV_UpperSat) {
    /* Saturate: '<S3>/DACB Limit (V)' */
    m_part1_B.DACBLimitV[0] = m_part1_P.DACBLimitV_UpperSat;
  } else if (u0 < m_part1_P.DACBLimitV_LowerSat) {
    /* Saturate: '<S3>/DACB Limit (V)' */
    m_part1_B.DACBLimitV[0] = m_part1_P.DACBLimitV_LowerSat;
  } else {
    /* Saturate: '<S3>/DACB Limit (V)' */
    m_part1_B.DACBLimitV[0] = u0;
  }

  /* Saturate: '<S3>/UPM Voltage  Limit (V)' */
  if (rtb_Sum1 > m_part1_P.UPMVoltageLimitV_UpperSat) {
    u0 = m_part1_P.UPMVoltageLimitV_UpperSat;
  } else if (rtb_Sum1 < m_part1_P.UPMVoltageLimitV_LowerSat) {
    u0 = m_part1_P.UPMVoltageLimitV_LowerSat;
  } else {
    u0 = rtb_Sum1;
  }

  /* Gain: '<S3>/Cable Gain Pre-Compensation' */
  u0 *= m_part1_P.CableGainPreCompensation_Gain;

  /* Saturate: '<S3>/DACB Limit (V)' */
  if (u0 > m_part1_P.DACBLimitV_UpperSat) {
    /* Saturate: '<S3>/DACB Limit (V)' */
    m_part1_B.DACBLimitV[1] = m_part1_P.DACBLimitV_UpperSat;
  } else if (u0 < m_part1_P.DACBLimitV_LowerSat) {
    /* Saturate: '<S3>/DACB Limit (V)' */
    m_part1_B.DACBLimitV[1] = m_part1_P.DACBLimitV_LowerSat;
  } else {
    /* Saturate: '<S3>/DACB Limit (V)' */
    m_part1_B.DACBLimitV[1] = u0;
  }

  /* Saturate: '<S3>/UPM Voltage  Limit (V)' */
  if (rtb_Front > m_part1_P.UPMVoltageLimitV_UpperSat) {
    rtb_Front = m_part1_P.UPMVoltageLimitV_UpperSat;
  } else if (rtb_Front < m_part1_P.UPMVoltageLimitV_LowerSat) {
    rtb_Front = m_part1_P.UPMVoltageLimitV_LowerSat;
  }

  /* Gain: '<S3>/Cable Gain Pre-Compensation' */
  u0 = m_part1_P.CableGainPreCompensation_Gain * rtb_Front;

  /* Saturate: '<S3>/DACB Limit (V)' */
  if (u0 > m_part1_P.DACBLimitV_UpperSat) {
    /* Saturate: '<S3>/DACB Limit (V)' */
    m_part1_B.DACBLimitV[2] = m_part1_P.DACBLimitV_UpperSat;
  } else if (u0 < m_part1_P.DACBLimitV_LowerSat) {
    /* Saturate: '<S3>/DACB Limit (V)' */
    m_part1_B.DACBLimitV[2] = m_part1_P.DACBLimitV_LowerSat;
  } else {
    /* Saturate: '<S3>/DACB Limit (V)' */
    m_part1_B.DACBLimitV[2] = u0;
  }

  /* Saturate: '<S3>/UPM Voltage  Limit (V)' */
  if (rtb_Sum1 > m_part1_P.UPMVoltageLimitV_UpperSat) {
    rtb_Sum1 = m_part1_P.UPMVoltageLimitV_UpperSat;
  } else if (rtb_Sum1 < m_part1_P.UPMVoltageLimitV_LowerSat) {
    rtb_Sum1 = m_part1_P.UPMVoltageLimitV_LowerSat;
  }

  /* Gain: '<S3>/Cable Gain Pre-Compensation' */
  u0 = m_part1_P.CableGainPreCompensation_Gain * rtb_Sum1;

  /* Saturate: '<S3>/DACB Limit (V)' */
  if (u0 > m_part1_P.DACBLimitV_UpperSat) {
    /* Saturate: '<S3>/DACB Limit (V)' */
    m_part1_B.DACBLimitV[3] = m_part1_P.DACBLimitV_UpperSat;
  } else if (u0 < m_part1_P.DACBLimitV_LowerSat) {
    /* Saturate: '<S3>/DACB Limit (V)' */
    m_part1_B.DACBLimitV[3] = m_part1_P.DACBLimitV_LowerSat;
  } else {
    /* Saturate: '<S3>/DACB Limit (V)' */
    m_part1_B.DACBLimitV[3] = u0;
  }

  if (rtmIsMajorTimeStep(m_part1_M)) {
    /* S-Function (hil_write_analog_block): '<S3>/HIL Write Analog' */

    /* S-Function Block: m_part1/Subsystem/3-DOF Helicopter IO/HIL Write Analog (hil_write_analog_block) */
    {
      t_error result;
      result = hil_write_analog(m_part1_DW.HILInitialize_Card,
        m_part1_P.HILWriteAnalog_channels, 4, &m_part1_B.DACBLimitV[0]);
      if (result < 0) {
        msg_get_error_messageA(NULL, result, _rt_error_message, sizeof
          (_rt_error_message));
        rtmSetErrorStatus(m_part1_M, _rt_error_message);
      }
    }

    /* Gain: '<S1>/Gain' */
    m_part1_B.Gain = m_part1_P.Gain_Gain * rtb_EncoderResolutionElevationr;
  }

  /* Gain: '<S5>/K_pi' */
  m_part1_B.K_pi = m_part1_P.K_pi_Gain * rtb_EncoderResolutionPitchradco;

  /* Gain: '<S6>/K_ti' */
  m_part1_B.K_ti = m_part1_P.K_ti_Gain * rtb_TravelError;
}

/* Model update function */
void m_part1_update(void)
{
  if (rtmIsMajorTimeStep(m_part1_M)) {
    rt_ertODEUpdateContinuousStates(&m_part1_M->solverInfo);
  }

  /* Update absolute time for base rate */
  /* The "clockTick0" counts the number of times the code of this task has
   * been executed. The absolute time is the multiplication of "clockTick0"
   * and "Timing.stepSize0". Size of "clockTick0" ensures timer will not
   * overflow during the application lifespan selected.
   * Timer of this task consists of two 32 bit unsigned integers.
   * The two integers represent the low bits Timing.clockTick0 and the high bits
   * Timing.clockTickH0. When the low bit overflows to 0, the high bits increment.
   */
  if (!(++m_part1_M->Timing.clockTick0)) {
    ++m_part1_M->Timing.clockTickH0;
  }

  m_part1_M->Timing.t[0] = rtsiGetSolverStopTime(&m_part1_M->solverInfo);

  {
    /* Update absolute timer for sample time: [0.001s, 0.0s] */
    /* The "clockTick1" counts the number of times the code of this task has
     * been executed. The absolute time is the multiplication of "clockTick1"
     * and "Timing.stepSize1". Size of "clockTick1" ensures timer will not
     * overflow during the application lifespan selected.
     * Timer of this task consists of two 32 bit unsigned integers.
     * The two integers represent the low bits Timing.clockTick1 and the high bits
     * Timing.clockTickH1. When the low bit overflows to 0, the high bits increment.
     */
    if (!(++m_part1_M->Timing.clockTick1)) {
      ++m_part1_M->Timing.clockTickH1;
    }

    m_part1_M->Timing.t[1] = m_part1_M->Timing.clockTick1 *
      m_part1_M->Timing.stepSize1 + m_part1_M->Timing.clockTickH1 *
      m_part1_M->Timing.stepSize1 * 4294967296.0;
  }
}

/* Derivatives for root system: '<Root>' */
void m_part1_derivatives(void)
{
  XDot_m_part1_T *_rtXdot;
  boolean_T lsat;
  boolean_T usat;
  _rtXdot = ((XDot_m_part1_T *) m_part1_M->derivs);

  /* Derivatives for Integrator: '<S5>/Integrator' */
  lsat = (m_part1_X.Integrator_CSTATE <= m_part1_P.Integrator_LowerSat);
  usat = (m_part1_X.Integrator_CSTATE >= m_part1_P.Integrator_UpperSat);
  if (((!lsat) && (!usat)) || (lsat && (m_part1_B.K_pi > 0.0)) || (usat &&
       (m_part1_B.K_pi < 0.0))) {
    _rtXdot->Integrator_CSTATE = m_part1_B.K_pi;
  } else {
    /* in saturation */
    _rtXdot->Integrator_CSTATE = 0.0;
  }

  /* End of Derivatives for Integrator: '<S5>/Integrator' */

  /* Derivatives for Integrator: '<S6>/Integrator' */
  lsat = (m_part1_X.Integrator_CSTATE_p <= m_part1_P.Integrator_LowerSat_o);
  usat = (m_part1_X.Integrator_CSTATE_p >= m_part1_P.Integrator_UpperSat_i);
  if (((!lsat) && (!usat)) || (lsat && (m_part1_B.K_ti > 0.0)) || (usat &&
       (m_part1_B.K_ti < 0.0))) {
    _rtXdot->Integrator_CSTATE_p = m_part1_B.K_ti;
  } else {
    /* in saturation */
    _rtXdot->Integrator_CSTATE_p = 0.0;
  }

  /* End of Derivatives for Integrator: '<S6>/Integrator' */

  /* Derivatives for TransferFcn: '<S1>/Travel  Low pass' */
  _rtXdot->TravelLowpass_CSTATE = 0.0;
  _rtXdot->TravelLowpass_CSTATE += m_part1_P.TravelLowpass_A *
    m_part1_X.TravelLowpass_CSTATE;
  _rtXdot->TravelLowpass_CSTATE += m_part1_B.Gain2;

  /* Derivatives for TransferFcn: '<S1>/Travel Deriv2' */
  _rtXdot->TravelDeriv2_CSTATE = 0.0;
  _rtXdot->TravelDeriv2_CSTATE += m_part1_P.TravelDeriv2_A *
    m_part1_X.TravelDeriv2_CSTATE;
  _rtXdot->TravelDeriv2_CSTATE += m_part1_B.Gain2;

  /* Derivatives for TransferFcn: '<S1>/Travel Deriv1' */
  _rtXdot->TravelDeriv1_CSTATE = 0.0;
  _rtXdot->TravelDeriv1_CSTATE += m_part1_P.TravelDeriv1_A *
    m_part1_X.TravelDeriv1_CSTATE;
  _rtXdot->TravelDeriv1_CSTATE += m_part1_B.Gain1;

  /* Derivatives for TransferFcn: '<S1>/Travel Deriv' */
  _rtXdot->TravelDeriv_CSTATE = 0.0;
  _rtXdot->TravelDeriv_CSTATE += m_part1_P.TravelDeriv_A *
    m_part1_X.TravelDeriv_CSTATE;
  _rtXdot->TravelDeriv_CSTATE += m_part1_B.Gain;
}

/* Model initialize function */
void m_part1_initialize(void)
{
  /* Start for S-Function (hil_initialize_block): '<S3>/HIL Initialize' */

  /* S-Function Block: m_part1/Subsystem/3-DOF Helicopter IO/HIL Initialize (hil_initialize_block) */
  {
    t_int result;
    t_boolean is_switching;
    result = hil_open("q8_usb", "0", &m_part1_DW.HILInitialize_Card);
    if (result < 0) {
      msg_get_error_messageA(NULL, result, _rt_error_message, sizeof
        (_rt_error_message));
      rtmSetErrorStatus(m_part1_M, _rt_error_message);
      return;
    }

    is_switching = false;
    result = hil_set_card_specific_options(m_part1_DW.HILInitialize_Card,
      "update_rate=normal;decimation=1", 32);
    if (result < 0) {
      msg_get_error_messageA(NULL, result, _rt_error_message, sizeof
        (_rt_error_message));
      rtmSetErrorStatus(m_part1_M, _rt_error_message);
      return;
    }

    result = hil_watchdog_clear(m_part1_DW.HILInitialize_Card);
    if (result < 0 && result != -QERR_HIL_WATCHDOG_CLEAR) {
      msg_get_error_messageA(NULL, result, _rt_error_message, sizeof
        (_rt_error_message));
      rtmSetErrorStatus(m_part1_M, _rt_error_message);
      return;
    }

    if ((m_part1_P.HILInitialize_AIPStart && !is_switching) ||
        (m_part1_P.HILInitialize_AIPEnter && is_switching)) {
      {
        int_T i1;
        real_T *dw_AIMinimums = &m_part1_DW.HILInitialize_AIMinimums[0];
        for (i1=0; i1 < 8; i1++) {
          dw_AIMinimums[i1] = (m_part1_P.HILInitialize_AILow);
        }
      }

      {
        int_T i1;
        real_T *dw_AIMaximums = &m_part1_DW.HILInitialize_AIMaximums[0];
        for (i1=0; i1 < 8; i1++) {
          dw_AIMaximums[i1] = m_part1_P.HILInitialize_AIHigh;
        }
      }

      result = hil_set_analog_input_ranges(m_part1_DW.HILInitialize_Card,
        m_part1_P.HILInitialize_AIChannels, 8U,
        &m_part1_DW.HILInitialize_AIMinimums[0],
        &m_part1_DW.HILInitialize_AIMaximums[0]);
      if (result < 0) {
        msg_get_error_messageA(NULL, result, _rt_error_message, sizeof
          (_rt_error_message));
        rtmSetErrorStatus(m_part1_M, _rt_error_message);
        return;
      }
    }

    if ((m_part1_P.HILInitialize_AOPStart && !is_switching) ||
        (m_part1_P.HILInitialize_AOPEnter && is_switching)) {
      {
        int_T i1;
        real_T *dw_AOMinimums = &m_part1_DW.HILInitialize_AOMinimums[0];
        for (i1=0; i1 < 8; i1++) {
          dw_AOMinimums[i1] = (m_part1_P.HILInitialize_AOLow);
        }
      }

      {
        int_T i1;
        real_T *dw_AOMaximums = &m_part1_DW.HILInitialize_AOMaximums[0];
        for (i1=0; i1 < 8; i1++) {
          dw_AOMaximums[i1] = m_part1_P.HILInitialize_AOHigh;
        }
      }

      result = hil_set_analog_output_ranges(m_part1_DW.HILInitialize_Card,
        m_part1_P.HILInitialize_AOChannels, 8U,
        &m_part1_DW.HILInitialize_AOMinimums[0],
        &m_part1_DW.HILInitialize_AOMaximums[0]);
      if (result < 0) {
        msg_get_error_messageA(NULL, result, _rt_error_message, sizeof
          (_rt_error_message));
        rtmSetErrorStatus(m_part1_M, _rt_error_message);
        return;
      }
    }

    if ((m_part1_P.HILInitialize_AOStart && !is_switching) ||
        (m_part1_P.HILInitialize_AOEnter && is_switching)) {
      {
        int_T i1;
        real_T *dw_AOVoltages = &m_part1_DW.HILInitialize_AOVoltages[0];
        for (i1=0; i1 < 8; i1++) {
          dw_AOVoltages[i1] = m_part1_P.HILInitialize_AOInitial;
        }
      }

      result = hil_write_analog(m_part1_DW.HILInitialize_Card,
        m_part1_P.HILInitialize_AOChannels, 8U,
        &m_part1_DW.HILInitialize_AOVoltages[0]);
      if (result < 0) {
        msg_get_error_messageA(NULL, result, _rt_error_message, sizeof
          (_rt_error_message));
        rtmSetErrorStatus(m_part1_M, _rt_error_message);
        return;
      }
    }

    if (m_part1_P.HILInitialize_AOReset) {
      {
        int_T i1;
        real_T *dw_AOVoltages = &m_part1_DW.HILInitialize_AOVoltages[0];
        for (i1=0; i1 < 8; i1++) {
          dw_AOVoltages[i1] = m_part1_P.HILInitialize_AOWatchdog;
        }
      }

      result = hil_watchdog_set_analog_expiration_state
        (m_part1_DW.HILInitialize_Card, m_part1_P.HILInitialize_AOChannels, 8U,
         &m_part1_DW.HILInitialize_AOVoltages[0]);
      if (result < 0) {
        msg_get_error_messageA(NULL, result, _rt_error_message, sizeof
          (_rt_error_message));
        rtmSetErrorStatus(m_part1_M, _rt_error_message);
        return;
      }
    }

    if ((m_part1_P.HILInitialize_EIPStart && !is_switching) ||
        (m_part1_P.HILInitialize_EIPEnter && is_switching)) {
      {
        int_T i1;
        int32_T *dw_QuadratureModes = &m_part1_DW.HILInitialize_QuadratureModes
          [0];
        for (i1=0; i1 < 8; i1++) {
          dw_QuadratureModes[i1] = m_part1_P.HILInitialize_EIQuadrature;
        }
      }

      result = hil_set_encoder_quadrature_mode(m_part1_DW.HILInitialize_Card,
        m_part1_P.HILInitialize_EIChannels, 8U, (t_encoder_quadrature_mode *)
        &m_part1_DW.HILInitialize_QuadratureModes[0]);
      if (result < 0) {
        msg_get_error_messageA(NULL, result, _rt_error_message, sizeof
          (_rt_error_message));
        rtmSetErrorStatus(m_part1_M, _rt_error_message);
        return;
      }
    }

    if ((m_part1_P.HILInitialize_EIStart && !is_switching) ||
        (m_part1_P.HILInitialize_EIEnter && is_switching)) {
      {
        int_T i1;
        int32_T *dw_InitialEICounts = &m_part1_DW.HILInitialize_InitialEICounts
          [0];
        for (i1=0; i1 < 8; i1++) {
          dw_InitialEICounts[i1] = m_part1_P.HILInitialize_EIInitial;
        }
      }

      result = hil_set_encoder_counts(m_part1_DW.HILInitialize_Card,
        m_part1_P.HILInitialize_EIChannels, 8U,
        &m_part1_DW.HILInitialize_InitialEICounts[0]);
      if (result < 0) {
        msg_get_error_messageA(NULL, result, _rt_error_message, sizeof
          (_rt_error_message));
        rtmSetErrorStatus(m_part1_M, _rt_error_message);
        return;
      }
    }

    if ((m_part1_P.HILInitialize_POPStart && !is_switching) ||
        (m_part1_P.HILInitialize_POPEnter && is_switching)) {
      uint32_T num_duty_cycle_modes = 0;
      uint32_T num_frequency_modes = 0;

      {
        int_T i1;
        int32_T *dw_POModeValues = &m_part1_DW.HILInitialize_POModeValues[0];
        for (i1=0; i1 < 8; i1++) {
          dw_POModeValues[i1] = m_part1_P.HILInitialize_POModes;
        }
      }

      result = hil_set_pwm_mode(m_part1_DW.HILInitialize_Card,
        m_part1_P.HILInitialize_POChannels, 8U, (t_pwm_mode *)
        &m_part1_DW.HILInitialize_POModeValues[0]);
      if (result < 0) {
        msg_get_error_messageA(NULL, result, _rt_error_message, sizeof
          (_rt_error_message));
        rtmSetErrorStatus(m_part1_M, _rt_error_message);
        return;
      }

      {
        int_T i1;
        const uint32_T *p_HILInitialize_POChannels =
          m_part1_P.HILInitialize_POChannels;
        int32_T *dw_POModeValues = &m_part1_DW.HILInitialize_POModeValues[0];
        for (i1=0; i1 < 8; i1++) {
          if (dw_POModeValues[i1] == PWM_DUTY_CYCLE_MODE || dw_POModeValues[i1] ==
              PWM_ONE_SHOT_MODE || dw_POModeValues[i1] == PWM_TIME_MODE ||
              dw_POModeValues[i1] == PWM_RAW_MODE) {
            m_part1_DW.HILInitialize_POSortedChans[num_duty_cycle_modes] =
              (p_HILInitialize_POChannels[i1]);
            m_part1_DW.HILInitialize_POSortedFreqs[num_duty_cycle_modes] =
              m_part1_P.HILInitialize_POFrequency;
            num_duty_cycle_modes++;
          } else {
            m_part1_DW.HILInitialize_POSortedChans[7U - num_frequency_modes] =
              (p_HILInitialize_POChannels[i1]);
            m_part1_DW.HILInitialize_POSortedFreqs[7U - num_frequency_modes] =
              m_part1_P.HILInitialize_POFrequency;
            num_frequency_modes++;
          }
        }
      }

      if (num_duty_cycle_modes > 0) {
        result = hil_set_pwm_frequency(m_part1_DW.HILInitialize_Card,
          &m_part1_DW.HILInitialize_POSortedChans[0], num_duty_cycle_modes,
          &m_part1_DW.HILInitialize_POSortedFreqs[0]);
        if (result < 0) {
          msg_get_error_messageA(NULL, result, _rt_error_message, sizeof
            (_rt_error_message));
          rtmSetErrorStatus(m_part1_M, _rt_error_message);
          return;
        }
      }

      if (num_frequency_modes > 0) {
        result = hil_set_pwm_duty_cycle(m_part1_DW.HILInitialize_Card,
          &m_part1_DW.HILInitialize_POSortedChans[num_duty_cycle_modes],
          num_frequency_modes,
          &m_part1_DW.HILInitialize_POSortedFreqs[num_duty_cycle_modes]);
        if (result < 0) {
          msg_get_error_messageA(NULL, result, _rt_error_message, sizeof
            (_rt_error_message));
          rtmSetErrorStatus(m_part1_M, _rt_error_message);
          return;
        }
      }

      {
        int_T i1;
        int32_T *dw_POModeValues = &m_part1_DW.HILInitialize_POModeValues[0];
        for (i1=0; i1 < 8; i1++) {
          dw_POModeValues[i1] = m_part1_P.HILInitialize_POConfiguration;
        }
      }

      {
        int_T i1;
        int32_T *dw_POAlignValues = &m_part1_DW.HILInitialize_POAlignValues[0];
        for (i1=0; i1 < 8; i1++) {
          dw_POAlignValues[i1] = m_part1_P.HILInitialize_POAlignment;
        }
      }

      {
        int_T i1;
        int32_T *dw_POPolarityVals = &m_part1_DW.HILInitialize_POPolarityVals[0];
        for (i1=0; i1 < 8; i1++) {
          dw_POPolarityVals[i1] = m_part1_P.HILInitialize_POPolarity;
        }
      }

      result = hil_set_pwm_configuration(m_part1_DW.HILInitialize_Card,
        m_part1_P.HILInitialize_POChannels, 8U,
        (t_pwm_configuration *) &m_part1_DW.HILInitialize_POModeValues[0],
        (t_pwm_alignment *) &m_part1_DW.HILInitialize_POAlignValues[0],
        (t_pwm_polarity *) &m_part1_DW.HILInitialize_POPolarityVals[0]);
      if (result < 0) {
        msg_get_error_messageA(NULL, result, _rt_error_message, sizeof
          (_rt_error_message));
        rtmSetErrorStatus(m_part1_M, _rt_error_message);
        return;
      }

      {
        int_T i1;
        real_T *dw_POSortedFreqs = &m_part1_DW.HILInitialize_POSortedFreqs[0];
        for (i1=0; i1 < 8; i1++) {
          dw_POSortedFreqs[i1] = m_part1_P.HILInitialize_POLeading;
        }
      }

      {
        int_T i1;
        real_T *dw_POValues = &m_part1_DW.HILInitialize_POValues[0];
        for (i1=0; i1 < 8; i1++) {
          dw_POValues[i1] = m_part1_P.HILInitialize_POTrailing;
        }
      }

      result = hil_set_pwm_deadband(m_part1_DW.HILInitialize_Card,
        m_part1_P.HILInitialize_POChannels, 8U,
        &m_part1_DW.HILInitialize_POSortedFreqs[0],
        &m_part1_DW.HILInitialize_POValues[0]);
      if (result < 0) {
        msg_get_error_messageA(NULL, result, _rt_error_message, sizeof
          (_rt_error_message));
        rtmSetErrorStatus(m_part1_M, _rt_error_message);
        return;
      }
    }

    if ((m_part1_P.HILInitialize_POStart && !is_switching) ||
        (m_part1_P.HILInitialize_POEnter && is_switching)) {
      {
        int_T i1;
        real_T *dw_POValues = &m_part1_DW.HILInitialize_POValues[0];
        for (i1=0; i1 < 8; i1++) {
          dw_POValues[i1] = m_part1_P.HILInitialize_POInitial;
        }
      }

      result = hil_write_pwm(m_part1_DW.HILInitialize_Card,
        m_part1_P.HILInitialize_POChannels, 8U,
        &m_part1_DW.HILInitialize_POValues[0]);
      if (result < 0) {
        msg_get_error_messageA(NULL, result, _rt_error_message, sizeof
          (_rt_error_message));
        rtmSetErrorStatus(m_part1_M, _rt_error_message);
        return;
      }
    }

    if (m_part1_P.HILInitialize_POReset) {
      {
        int_T i1;
        real_T *dw_POValues = &m_part1_DW.HILInitialize_POValues[0];
        for (i1=0; i1 < 8; i1++) {
          dw_POValues[i1] = m_part1_P.HILInitialize_POWatchdog;
        }
      }

      result = hil_watchdog_set_pwm_expiration_state
        (m_part1_DW.HILInitialize_Card, m_part1_P.HILInitialize_POChannels, 8U,
         &m_part1_DW.HILInitialize_POValues[0]);
      if (result < 0) {
        msg_get_error_messageA(NULL, result, _rt_error_message, sizeof
          (_rt_error_message));
        rtmSetErrorStatus(m_part1_M, _rt_error_message);
        return;
      }
    }
  }

  /* Start for S-Function (hil_read_encoder_timebase_block): '<S3>/HIL Read Encoder Timebase' */

  /* S-Function Block: m_part1/Subsystem/3-DOF Helicopter IO/HIL Read Encoder Timebase (hil_read_encoder_timebase_block) */
  {
    t_error result;
    result = hil_task_create_encoder_reader(m_part1_DW.HILInitialize_Card,
      m_part1_P.HILReadEncoderTimebase_SamplesI,
      m_part1_P.HILReadEncoderTimebase_Channels, 3,
      &m_part1_DW.HILReadEncoderTimebase_Task);
    if (result >= 0) {
      result = hil_task_set_buffer_overflow_mode
        (m_part1_DW.HILReadEncoderTimebase_Task, (t_buffer_overflow_mode)
         (m_part1_P.HILReadEncoderTimebase_Overflow - 1));
    }

    if (result < 0) {
      msg_get_error_messageA(NULL, result, _rt_error_message, sizeof
        (_rt_error_message));
      rtmSetErrorStatus(m_part1_M, _rt_error_message);
    }
  }

  /* InitializeConditions for Integrator: '<S5>/Integrator' */
  m_part1_X.Integrator_CSTATE = m_part1_P.Integrator_IC;

  /* InitializeConditions for Integrator: '<S6>/Integrator' */
  m_part1_X.Integrator_CSTATE_p = m_part1_P.Integrator_IC_c;

  /* InitializeConditions for TransferFcn: '<S1>/Travel  Low pass' */
  m_part1_X.TravelLowpass_CSTATE = 0.0;

  /* InitializeConditions for TransferFcn: '<S1>/Travel Deriv2' */
  m_part1_X.TravelDeriv2_CSTATE = 0.0;

  /* InitializeConditions for TransferFcn: '<S1>/Travel Deriv1' */
  m_part1_X.TravelDeriv1_CSTATE = 0.0;

  /* InitializeConditions for TransferFcn: '<S1>/Travel Deriv' */
  m_part1_X.TravelDeriv_CSTATE = 0.0;
}

/* Model terminate function */
void m_part1_terminate(void)
{
  /* Terminate for S-Function (hil_initialize_block): '<S3>/HIL Initialize' */

  /* S-Function Block: m_part1/Subsystem/3-DOF Helicopter IO/HIL Initialize (hil_initialize_block) */
  {
    t_boolean is_switching;
    t_int result;
    t_uint32 num_final_analog_outputs = 0;
    t_uint32 num_final_pwm_outputs = 0;
    hil_task_stop_all(m_part1_DW.HILInitialize_Card);
    hil_monitor_stop_all(m_part1_DW.HILInitialize_Card);
    is_switching = false;
    if ((m_part1_P.HILInitialize_AOTerminate && !is_switching) ||
        (m_part1_P.HILInitialize_AOExit && is_switching)) {
      {
        int_T i1;
        real_T *dw_AOVoltages = &m_part1_DW.HILInitialize_AOVoltages[0];
        for (i1=0; i1 < 8; i1++) {
          dw_AOVoltages[i1] = m_part1_P.HILInitialize_AOFinal;
        }
      }

      num_final_analog_outputs = 8U;
    } else {
      num_final_analog_outputs = 0;
    }

    if ((m_part1_P.HILInitialize_POTerminate && !is_switching) ||
        (m_part1_P.HILInitialize_POExit && is_switching)) {
      {
        int_T i1;
        real_T *dw_POValues = &m_part1_DW.HILInitialize_POValues[0];
        for (i1=0; i1 < 8; i1++) {
          dw_POValues[i1] = m_part1_P.HILInitialize_POFinal;
        }
      }

      num_final_pwm_outputs = 8U;
    } else {
      num_final_pwm_outputs = 0;
    }

    if (0
        || num_final_analog_outputs > 0
        || num_final_pwm_outputs > 0
        ) {
      /* Attempt to write the final outputs atomically (due to firmware issue in old Q2-USB). Otherwise write channels individually */
      result = hil_write(m_part1_DW.HILInitialize_Card
                         , m_part1_P.HILInitialize_AOChannels,
                         num_final_analog_outputs
                         , m_part1_P.HILInitialize_POChannels,
                         num_final_pwm_outputs
                         , NULL, 0
                         , NULL, 0
                         , &m_part1_DW.HILInitialize_AOVoltages[0]
                         , &m_part1_DW.HILInitialize_POValues[0]
                         , (t_boolean *) NULL
                         , NULL
                         );
      if (result == -QERR_HIL_WRITE_NOT_SUPPORTED) {
        t_error local_result;
        result = 0;

        /* The hil_write operation is not supported by this card. Write final outputs for each channel type */
        if (num_final_analog_outputs > 0) {
          local_result = hil_write_analog(m_part1_DW.HILInitialize_Card,
            m_part1_P.HILInitialize_AOChannels, num_final_analog_outputs,
            &m_part1_DW.HILInitialize_AOVoltages[0]);
          if (local_result < 0) {
            result = local_result;
          }
        }

        if (num_final_pwm_outputs > 0) {
          local_result = hil_write_pwm(m_part1_DW.HILInitialize_Card,
            m_part1_P.HILInitialize_POChannels, num_final_pwm_outputs,
            &m_part1_DW.HILInitialize_POValues[0]);
          if (local_result < 0) {
            result = local_result;
          }
        }

        if (result < 0) {
          msg_get_error_messageA(NULL, result, _rt_error_message, sizeof
            (_rt_error_message));
          rtmSetErrorStatus(m_part1_M, _rt_error_message);
        }
      }
    }

    hil_task_delete_all(m_part1_DW.HILInitialize_Card);
    hil_monitor_delete_all(m_part1_DW.HILInitialize_Card);
    hil_close(m_part1_DW.HILInitialize_Card);
    m_part1_DW.HILInitialize_Card = NULL;
  }
}

/*========================================================================*
 * Start of Classic call interface                                        *
 *========================================================================*/

/* Solver interface called by GRT_Main */
#ifndef USE_GENERATED_SOLVER

void rt_ODECreateIntegrationData(RTWSolverInfo *si)
{
  UNUSED_PARAMETER(si);
  return;
}                                      /* do nothing */

void rt_ODEDestroyIntegrationData(RTWSolverInfo *si)
{
  UNUSED_PARAMETER(si);
  return;
}                                      /* do nothing */

void rt_ODEUpdateContinuousStates(RTWSolverInfo *si)
{
  UNUSED_PARAMETER(si);
  return;
}                                      /* do nothing */

#endif

void MdlOutputs(int_T tid)
{
  m_part1_output();
  UNUSED_PARAMETER(tid);
}

void MdlUpdate(int_T tid)
{
  m_part1_update();
  UNUSED_PARAMETER(tid);
}

void MdlInitializeSizes(void)
{
}

void MdlInitializeSampleTimes(void)
{
}

void MdlInitialize(void)
{
}

void MdlStart(void)
{
  m_part1_initialize();
}

void MdlTerminate(void)
{
  m_part1_terminate();
}

/* Registration function */
RT_MODEL_m_part1_T *m_part1(void)
{
  /* Registration code */

  /* initialize non-finites */
  rt_InitInfAndNaN(sizeof(real_T));

  /* initialize real-time model */
  (void) memset((void *)m_part1_M, 0,
                sizeof(RT_MODEL_m_part1_T));

  {
    /* Setup solver object */
    rtsiSetSimTimeStepPtr(&m_part1_M->solverInfo, &m_part1_M->Timing.simTimeStep);
    rtsiSetTPtr(&m_part1_M->solverInfo, &rtmGetTPtr(m_part1_M));
    rtsiSetStepSizePtr(&m_part1_M->solverInfo, &m_part1_M->Timing.stepSize0);
    rtsiSetdXPtr(&m_part1_M->solverInfo, &m_part1_M->derivs);
    rtsiSetContStatesPtr(&m_part1_M->solverInfo, (real_T **)
                         &m_part1_M->contStates);
    rtsiSetNumContStatesPtr(&m_part1_M->solverInfo,
      &m_part1_M->Sizes.numContStates);
    rtsiSetNumPeriodicContStatesPtr(&m_part1_M->solverInfo,
      &m_part1_M->Sizes.numPeriodicContStates);
    rtsiSetPeriodicContStateIndicesPtr(&m_part1_M->solverInfo,
      &m_part1_M->periodicContStateIndices);
    rtsiSetPeriodicContStateRangesPtr(&m_part1_M->solverInfo,
      &m_part1_M->periodicContStateRanges);
    rtsiSetErrorStatusPtr(&m_part1_M->solverInfo, (&rtmGetErrorStatus(m_part1_M)));
    rtsiSetRTModelPtr(&m_part1_M->solverInfo, m_part1_M);
  }

  rtsiSetSimTimeStep(&m_part1_M->solverInfo, MAJOR_TIME_STEP);
  m_part1_M->intgData.f[0] = m_part1_M->odeF[0];
  m_part1_M->contStates = ((real_T *) &m_part1_X);
  rtsiSetSolverData(&m_part1_M->solverInfo, (void *)&m_part1_M->intgData);
  rtsiSetSolverName(&m_part1_M->solverInfo,"ode1");

  /* Initialize timing info */
  {
    int_T *mdlTsMap = m_part1_M->Timing.sampleTimeTaskIDArray;
    mdlTsMap[0] = 0;
    mdlTsMap[1] = 1;
    m_part1_M->Timing.sampleTimeTaskIDPtr = (&mdlTsMap[0]);
    m_part1_M->Timing.sampleTimes = (&m_part1_M->Timing.sampleTimesArray[0]);
    m_part1_M->Timing.offsetTimes = (&m_part1_M->Timing.offsetTimesArray[0]);

    /* task periods */
    m_part1_M->Timing.sampleTimes[0] = (0.0);
    m_part1_M->Timing.sampleTimes[1] = (0.001);

    /* task offsets */
    m_part1_M->Timing.offsetTimes[0] = (0.0);
    m_part1_M->Timing.offsetTimes[1] = (0.0);
  }

  rtmSetTPtr(m_part1_M, &m_part1_M->Timing.tArray[0]);

  {
    int_T *mdlSampleHits = m_part1_M->Timing.sampleHitArray;
    mdlSampleHits[0] = 1;
    mdlSampleHits[1] = 1;
    m_part1_M->Timing.sampleHits = (&mdlSampleHits[0]);
  }

  rtmSetTFinal(m_part1_M, 100.0);
  m_part1_M->Timing.stepSize0 = 0.001;
  m_part1_M->Timing.stepSize1 = 0.001;

  /* External mode info */
  m_part1_M->Sizes.checksums[0] = (2714981747U);
  m_part1_M->Sizes.checksums[1] = (1623036098U);
  m_part1_M->Sizes.checksums[2] = (1701346880U);
  m_part1_M->Sizes.checksums[3] = (3415083923U);

  {
    static const sysRanDType rtAlwaysEnabled = SUBSYS_RAN_BC_ENABLE;
    static RTWExtModeInfo rt_ExtModeInfo;
    static const sysRanDType *systemRan[1];
    m_part1_M->extModeInfo = (&rt_ExtModeInfo);
    rteiSetSubSystemActiveVectorAddresses(&rt_ExtModeInfo, systemRan);
    systemRan[0] = &rtAlwaysEnabled;
    rteiSetModelMappingInfoPtr(m_part1_M->extModeInfo,
      &m_part1_M->SpecialInfo.mappingInfo);
    rteiSetChecksumsPtr(m_part1_M->extModeInfo, m_part1_M->Sizes.checksums);
    rteiSetTPtr(m_part1_M->extModeInfo, rtmGetTPtr(m_part1_M));
  }

  m_part1_M->solverInfoPtr = (&m_part1_M->solverInfo);
  m_part1_M->Timing.stepSize = (0.001);
  rtsiSetFixedStepSize(&m_part1_M->solverInfo, 0.001);
  rtsiSetSolverMode(&m_part1_M->solverInfo, SOLVER_MODE_SINGLETASKING);

  /* block I/O */
  m_part1_M->blockIO = ((void *) &m_part1_B);

  {
    m_part1_B.TravelLowpass = 0.0;
    m_part1_B.Gain2 = 0.0;
    m_part1_B.Gain1 = 0.0;
    m_part1_B.ElevationInputTHISISTHEVALUEYOU = 0.0;
    m_part1_B.Saturation = 0.0;
    m_part1_B.DACBLimitV[0] = 0.0;
    m_part1_B.DACBLimitV[1] = 0.0;
    m_part1_B.DACBLimitV[2] = 0.0;
    m_part1_B.DACBLimitV[3] = 0.0;
    m_part1_B.Gain = 0.0;
    m_part1_B.K_pi = 0.0;
    m_part1_B.K_ti = 0.0;
  }

  /* parameters */
  m_part1_M->defaultParam = ((real_T *)&m_part1_P);

  /* states (continuous) */
  {
    real_T *x = (real_T *) &m_part1_X;
    m_part1_M->contStates = (x);
    (void) memset((void *)&m_part1_X, 0,
                  sizeof(X_m_part1_T));
  }

  /* states (dwork) */
  m_part1_M->dwork = ((void *) &m_part1_DW);
  (void) memset((void *)&m_part1_DW, 0,
                sizeof(DW_m_part1_T));

  {
    int32_T i;
    for (i = 0; i < 8; i++) {
      m_part1_DW.HILInitialize_AIMinimums[i] = 0.0;
    }
  }

  {
    int32_T i;
    for (i = 0; i < 8; i++) {
      m_part1_DW.HILInitialize_AIMaximums[i] = 0.0;
    }
  }

  {
    int32_T i;
    for (i = 0; i < 8; i++) {
      m_part1_DW.HILInitialize_AOMinimums[i] = 0.0;
    }
  }

  {
    int32_T i;
    for (i = 0; i < 8; i++) {
      m_part1_DW.HILInitialize_AOMaximums[i] = 0.0;
    }
  }

  {
    int32_T i;
    for (i = 0; i < 8; i++) {
      m_part1_DW.HILInitialize_AOVoltages[i] = 0.0;
    }
  }

  {
    int32_T i;
    for (i = 0; i < 8; i++) {
      m_part1_DW.HILInitialize_FilterFrequency[i] = 0.0;
    }
  }

  {
    int32_T i;
    for (i = 0; i < 8; i++) {
      m_part1_DW.HILInitialize_POSortedFreqs[i] = 0.0;
    }
  }

  {
    int32_T i;
    for (i = 0; i < 8; i++) {
      m_part1_DW.HILInitialize_POValues[i] = 0.0;
    }
  }

  /* data type transition information */
  {
    static DataTypeTransInfo dtInfo;
    (void) memset((char_T *) &dtInfo, 0,
                  sizeof(dtInfo));
    m_part1_M->SpecialInfo.mappingInfo = (&dtInfo);
    dtInfo.numDataTypes = 16;
    dtInfo.dataTypeSizes = &rtDataTypeSizes[0];
    dtInfo.dataTypeNames = &rtDataTypeNames[0];

    /* Block I/O transition table */
    dtInfo.BTransTable = &rtBTransTable;

    /* Parameters transition table */
    dtInfo.PTransTable = &rtPTransTable;
  }

  /* Initialize Sizes */
  m_part1_M->Sizes.numContStates = (6);/* Number of continuous states */
  m_part1_M->Sizes.numPeriodicContStates = (0);
                                      /* Number of periodic continuous states */
  m_part1_M->Sizes.numY = (0);         /* Number of model outputs */
  m_part1_M->Sizes.numU = (0);         /* Number of model inputs */
  m_part1_M->Sizes.sysDirFeedThru = (0);/* The model is not direct feedthrough */
  m_part1_M->Sizes.numSampTimes = (2); /* Number of sample times */
  m_part1_M->Sizes.numBlocks = (47);   /* Number of blocks */
  m_part1_M->Sizes.numBlockIO = (9);   /* Number of block outputs */
  m_part1_M->Sizes.numBlockPrms = (153);/* Sum of parameter "widths" */
  return m_part1_M;
}

/*========================================================================*
 * End of Classic call interface                                          *
 *========================================================================*/
