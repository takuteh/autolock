from __future__ import print_function
#from time import sleep
from ctypes import *
import subprocess
import RPi.GPIO as GPIO 
import time

PIN=11
PIN_RSW=3
GPIO.setmode(GPIO.BCM)
GPIO.setup(PIN_RSW,GPIO.IN,GPIO.PUD_DOWN)
GPIO.setup(PIN,GPIO.IN,GPIO.PUD_DOWN)

while True:
   m=GPIO.input(PIN_RSW)
   i=GPIO.input(PIN)
   if m==1:
       time.sleep(0.8)
       print("ON")
   else:
       time.sleep(0.8)
       print("OFF") 

         
