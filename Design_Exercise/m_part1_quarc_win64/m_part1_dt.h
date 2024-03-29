/*
 * m_part1_dt.h
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

#include "ext_types.h"

/* data type size table */
static uint_T rtDataTypeSizes[] = {
  sizeof(real_T),
  sizeof(real32_T),
  sizeof(int8_T),
  sizeof(uint8_T),
  sizeof(int16_T),
  sizeof(uint16_T),
  sizeof(int32_T),
  sizeof(uint32_T),
  sizeof(boolean_T),
  sizeof(fcn_call_T),
  sizeof(int_T),
  sizeof(void*),
  sizeof(action_T),
  2*sizeof(uint32_T),
  sizeof(t_card),
  sizeof(t_task)
};

/* data type name table */
static const char_T * rtDataTypeNames[] = {
  "real_T",
  "real32_T",
  "int8_T",
  "uint8_T",
  "int16_T",
  "uint16_T",
  "int32_T",
  "uint32_T",
  "boolean_T",
  "fcn_call_T",
  "int_T",
  "pointer_T",
  "action_T",
  "timer_uint32_pair_T",
  "t_card",
  "t_task"
};

/* data type transitions for block I/O structure */
static DataTypeTransition rtBTransitions[] = {
  { (char_T *)(&m_part1_B.TravelLowpass), 0, 0, 12 }
  ,

  { (char_T *)(&m_part1_DW.HILInitialize_AIMinimums[0]), 0, 0, 64 },

  { (char_T *)(&m_part1_DW.HILInitialize_Card), 14, 0, 1 },

  { (char_T *)(&m_part1_DW.HILReadEncoderTimebase_Task), 15, 0, 1 },

  { (char_T *)(&m_part1_DW.HILWriteAnalog_PWORK), 11, 0, 5 },

  { (char_T *)(&m_part1_DW.HILInitialize_ClockModes[0]), 6, 0, 46 },

  { (char_T *)(&m_part1_DW.HILInitialize_POSortedChans[0]), 7, 0, 8 }
};

/* data type transition table for block I/O structure */
static DataTypeTransitionTable rtBTransTable = {
  7U,
  rtBTransitions
};

/* data type transitions for Parameters structure */
static DataTypeTransition rtPTransitions[] = {
  { (char_T *)(&m_part1_P.HILWriteAnalog_channels[0]), 7, 0, 4 },

  { (char_T *)(&m_part1_P.HILInitialize_OOTerminate), 0, 0, 64 },

  { (char_T *)(&m_part1_P.HILInitialize_CKChannels[0]), 6, 0, 10 },

  { (char_T *)(&m_part1_P.HILInitialize_AIChannels[0]), 7, 0, 37 },

  { (char_T *)(&m_part1_P.HILInitialize_Active), 8, 0, 37 },

  { (char_T *)(&m_part1_P.HILReadEncoderTimebase_Overflow), 3, 0, 1 }
};

/* data type transition table for Parameters structure */
static DataTypeTransitionTable rtPTransTable = {
  6U,
  rtPTransitions
};

/* [EOF] m_part1_dt.h */
