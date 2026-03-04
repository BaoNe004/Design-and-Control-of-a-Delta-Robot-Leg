#include "Encoder.h"

volatile long int encoderValue1 = 0;
volatile long int encoderValue2 = 0;
volatile long int encoderValue3 = 0;

double th1 = 0;
double th2 = 0;
double th3 = 0;

#define DEBOUNCE_TIME 10 // Increase debounce time to 10ms

void IRAM_ATTR readEncoder1() {
    static unsigned long last_interrupt_time = 0;
    unsigned long interrupt_time = millis();
    if (interrupt_time - last_interrupt_time > DEBOUNCE_TIME) {
        int A = digitalRead(ENCODER1_A);
        int B = digitalRead(ENCODER1_B);

        if (A == B) {
            encoderValue1++;
        } else {
            encoderValue1--;
        }
    }
    last_interrupt_time = interrupt_time;
}

void IRAM_ATTR readEncoder2() {
    static unsigned long last_interrupt_time = 0;
    unsigned long interrupt_time = millis();
    if (interrupt_time - last_interrupt_time > DEBOUNCE_TIME) {
        int A = digitalRead(ENCODER2_A);
        int B = digitalRead(ENCODER2_B);

        if (A == B) {
            encoderValue2++;
        } else {
            encoderValue2--;
        }
    }
    last_interrupt_time = interrupt_time;
}

void IRAM_ATTR readEncoder3() {
    static unsigned long last_interrupt_time = 0;
    unsigned long interrupt_time = millis();
    if (interrupt_time - last_interrupt_time > DEBOUNCE_TIME) {
        int A = digitalRead(ENCODER3_A);
        int B = digitalRead(ENCODER3_B);

        if (A == B) {
            encoderValue3++;
        } else {
            encoderValue3--;
        }
    }
    last_interrupt_time = interrupt_time;
}

void Init_Encoders() {
    // Encoder 1
    pinMode(ENCODER1_A, INPUT);
    pinMode(ENCODER1_B, INPUT);
    attachInterrupt(digitalPinToInterrupt(ENCODER1_A), readEncoder1, CHANGE);

    // Encoder 2
    pinMode(ENCODER2_A, INPUT);
    pinMode(ENCODER2_B, INPUT);
    attachInterrupt(digitalPinToInterrupt(ENCODER2_A), readEncoder2, CHANGE);

    // Encoder 3
    pinMode(ENCODER3_A, INPUT);
    pinMode(ENCODER3_B, INPUT);
    attachInterrupt(digitalPinToInterrupt(ENCODER3_A), readEncoder3, CHANGE);
}

void Get_Angles() {
    th1 = encoderValue1 * 360.0 / ENC_RES;
    th2 = encoderValue2 * 360.0 / ENC_RES;
    th3 = encoderValue3 * 360.0 / ENC_RES;
}