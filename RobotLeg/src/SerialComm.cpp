#include "SerialComm.h"
#include "MotorControl.h"
#include "Encoder.h"

unsigned long Serial_time = 0; // Time in microseconds

void Init_Serial() {
    Serial.begin(115200);
    while (!Serial);
}

void SerialDataPrint() {
    if (micros() - Serial_time >= 10000) {
        Serial_time = micros();
        Serial.print("Encoder 1 Value: ");
        Serial.println(encoderValue1);
        Serial.print("Encoder 2 Value: ");
        Serial.println(encoderValue2);
        Serial.print("Encoder 3 Value: ");
        Serial.println(encoderValue3);
        Serial.print(">MOT1_cmd:");
        Serial.println(MOT1_cmd);
        Serial.print(">MOT2_cmd:");
        Serial.println(MOT2_cmd);
        Serial.print(">MOT3_cmd:");
        Serial.println(MOT3_cmd);
    }
}

void SerialDataWrite() {
    static String received_chars;
    while (Serial.available()) {
        char inChar = (char)Serial.read();
        received_chars += inChar;
        if (inChar == '\n') {
            switch (received_chars[0]) {
                case 'q':
                    received_chars.remove(0, 1);
                    if (received_chars.length() > 0) {
                        MOT1_cmd = received_chars.toFloat();
                        Serial.print("Updated MOT1_cmd: "); // Debug statement
                        Serial.println(MOT1_cmd);
                    } else {
                        Serial.println("Error: No command received.");
                    }
                    break;
                case 'w':
                    received_chars.remove(0, 1);
                    if (received_chars.length() > 0) {
                        MOT2_cmd = received_chars.toFloat();
                        Serial.print("Updated MOT2_cmd: "); // Debug statement
                        Serial.println(MOT2_cmd);
                    } else {
                        Serial.println("Error: No command received.");
                    }
                    break;
                case 'e':
                    received_chars.remove(0, 1);
                    if (received_chars.length() > 0) {
                        MOT3_cmd = received_chars.toFloat();
                        Serial.print("Updated MOT3_cmd: "); // Debug statement
                        Serial.println(MOT3_cmd);
                    } else {
                        Serial.println("Error: No command received.");
                    }
                    break;
                default:
                    Serial.println("Error: Invalid command.");
                    break;
            }
            received_chars = "";
        }
    }
}