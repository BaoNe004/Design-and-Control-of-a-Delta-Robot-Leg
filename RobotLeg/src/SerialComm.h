#ifndef SERIALCOMM_H
#define SERIALCOMM_H

#include <Arduino.h>

extern unsigned long Serial_time; // Time in microseconds

void Init_Serial();
void SerialDataPrint();
void SerialDataWrite();

#endif  // SERIALCOMM_H
