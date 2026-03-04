#ifndef MOTORCONTROL_H
#define MOTORCONTROL_H

#include <Arduino.h>

// Motor 1
#define MOT1_A 18
#define MOT1_B 19
#define MOT1_C 23
// Example
#define MOT1_Channel 0

// Motor 2
#define MOT2_A 22
#define MOT2_B 21
#define MOT2_C 23
#define MOT2_Channel 1

// Motor 3
#define MOT3_A 14
#define MOT3_B 15
#define MOT3_C 13
#define MOT3_Channel 2

#define PWM_FREQ 10000 // PWM Frequency: 10kHz
#define PWM_RES 8      // PWM resolution 255

extern double MOT1_cmd;
extern double MOT2_cmd;
extern double MOT3_cmd;

void Init_Motors();
void Send_PWM(int PINA, int PINB, int PINC, double mot_cmd, int channel);
void Run_Motors();

#endif