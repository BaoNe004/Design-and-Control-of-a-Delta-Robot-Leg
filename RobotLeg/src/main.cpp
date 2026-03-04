#include <Arduino.h>
#include "MotorControl.h"
#include "Encoder.h"
#include "SerialComm.h"

void setup() {
    Serial.begin(115200);  // Initialize serial communication
    Init_Motors();         // Initialize motor control for all motors
    Init_Encoders();       // Initialize encoders for all motors
    Init_Serial();         // Initialize serial communication
}

void loop() {
    // Set fixed motor commands for testing
    MOT1_cmd = 100;
    MOT2_cmd = 150;
    MOT3_cmd = 200;

    Run_Motors();          // Run all motors with the current commands
    SerialDataPrint();     // Print encoder and motor command values
    SerialDataWrite();     // Read serial input and update motor commands

    // Debug print moved to the main loop
    static unsigned long last_print_time = 0;
    if (millis() - last_print_time >= 100) { // Print every 100ms
        last_print_time = millis();
        Get_Angles(); // Update angles based on encoder values

        Serial.print("Encoder 1 Value: ");
        Serial.println(encoderValue1);
        Serial.print("Angle 1: ");
        Serial.println(th1);

        Serial.print("Encoder 2 Value: ");
        Serial.println(encoderValue2);
        Serial.print("Angle 2: ");
        Serial.println(th2);

        Serial.print("Encoder 3 Value: ");
        Serial.println(encoderValue3);
        Serial.print("Angle 3: ");
        Serial.println(th3);
    }
}