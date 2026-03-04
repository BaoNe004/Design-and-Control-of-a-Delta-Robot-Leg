#ifndef ENCODER_H
#define ENCODER_H

#include <Arduino.h>

// Encoder 1
#define ENCODER1_A 32
#define ENCODER1_B 33

// Encoder 2
#define ENCODER2_A 34
#define ENCODER2_B 35

// Encoder 3
#define ENCODER3_A 2
#define ENCODER3_B 4

#define ENC_RES 330  // Encoder resolution * Gearbox ratio

extern volatile long int encoderValue1;
extern volatile long int encoderValue2;
extern volatile long int encoderValue3;

extern double th1;
extern double th2;
extern double th3;

void Init_Encoders();
void IRAM_ATTR readEncoder1();
void IRAM_ATTR readEncoder2();
void IRAM_ATTR readEncoder3();
void Get_Angles();

#endif