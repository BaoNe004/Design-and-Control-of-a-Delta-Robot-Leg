#include "MotorControl.h"

double MOT1_cmd = 0; // Motor command [-255, 255]
double MOT2_cmd = 0;
double MOT3_cmd = 0;

void Init_Motors() {
    // Motor 1
    pinMode(MOT1_A, OUTPUT);
    pinMode(MOT1_B, OUTPUT);
    pinMode(MOT1_C, OUTPUT);
    ledcSetup(MOT1_Channel, PWM_FREQ, PWM_RES);
    ledcAttachPin(MOT1_A, MOT1_Channel);

    // Motor 2
    pinMode(MOT2_A, OUTPUT);
    pinMode(MOT2_B, OUTPUT);
    pinMode(MOT2_C, OUTPUT);
    ledcSetup(MOT2_Channel, PWM_FREQ, PWM_RES);
    ledcAttachPin(MOT2_A, MOT2_Channel);

    // Motor 3
    pinMode(MOT3_A, OUTPUT);
    pinMode(MOT3_B, OUTPUT);
    pinMode(MOT3_C, OUTPUT);
    ledcSetup(MOT3_Channel, PWM_FREQ, PWM_RES);
    ledcAttachPin(MOT3_A, MOT3_Channel);
}

void Send_PWM(int PINA, int PINB, int PINC, double mot_cmd, int channel) {
    if (mot_cmd < 0) {
        digitalWrite(PINA, LOW);
        digitalWrite(PINB, HIGH);
        digitalWrite(PINC, HIGH);
    } else {
        digitalWrite(PINA, HIGH);
        digitalWrite(PINB, LOW);
        digitalWrite(PINC, HIGH);
    }
    ledcWrite(channel, abs(mot_cmd));
}

void Run_Motors() {
    Serial.println("Running Motors...");
    
    Serial.print("MOT1_cmd: ");
    Serial.println(MOT1_cmd);
    Send_PWM(MOT1_A, MOT1_B, MOT1_C, MOT1_cmd, MOT1_Channel);
    
    Serial.print("MOT2_cmd: ");
    Serial.println(MOT2_cmd);
    Send_PWM(MOT2_A, MOT2_B, MOT2_C, MOT2_cmd, MOT2_Channel);
    
    Serial.print("MOT3_cmd: ");
    Serial.println(MOT3_cmd);
    Send_PWM(MOT3_A, MOT3_B, MOT3_C, MOT3_cmd, MOT3_Channel);
}