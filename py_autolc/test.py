import OpCl
import RPi.GPIO as GPIO
import time

oc=OpCl.opcl()

oc.open()
time.sleep(2)
oc.close()