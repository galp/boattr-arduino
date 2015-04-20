# Arduino Make file. Refer to https://github.com/sudar/Arduino-Makefile

BOARD_TAG    = uno
ARDUINO_LIBS =  Wire SoftwareSerial
USER_LIB_PATH = ~/sketchbook/libraries
include ~/dev/Arduino-Makefile/Arduino.mk
