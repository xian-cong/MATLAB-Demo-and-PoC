/*
 * File: coder_profile_timer.h
 *
 * Code generated for instrumentation.
 *
 */

#include "rtwtypes.h"

/* Pause/restart the timer while running code associated with storing and uploading the data. */
void xilProfilingTimerFreeze(void);
void xilProfilingTimerUnFreeze(void);

/* Code instrumentation method(s) for model Current Control */
void profileStart_Current_Control(uint16_T sectionId);
void profileEnd_Current_Control(uint16_T sectionId);
