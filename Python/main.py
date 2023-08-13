from __future__ import print_function
from ctypes import *
import subprocess
import RPi.GPIO as GPIO 
import time

def door():
                subprocess.call("./open")
                time.sleep(4)
                while True:
                 m=GPIO.input(PIN_RSW)
                 if m==0:
                  time.sleep(0.8)
                  subprocess.call("./close")
                  # print("m=1")
                  break

def callback(PIN):
 door()               
               

PIN=9 #ボタンのGPIO
PIN_RSW=3 #リードスイッチのGPIO
GPIO.setmode(GPIO.BCM)
GPIO.setup(PIN_RSW,GPIO.IN)
GPIO.setup(PIN,GPIO.IN,GPIO.PUD_DOWN)


GPIO.add_event_detect(PIN,GPIO.RISING,bouncetime=300)
GPIO.add_event_callback(PIN,callback)



# libpafe.hの77行目で定義
FELICA_POLLING_ANY = 0xffff
 
 
if __name__ == '__main__':
 
    libpafe = cdll.LoadLibrary("/usr/local/lib/libpafe.so")
    libpafe.pasori_open.restype = c_void_p
    pasori = libpafe.pasori_open()
    libpafe.pasori_init(pasori)
    libpafe.felica_polling.restype = c_void_p
    
    try:
        while True:
            
            felica = libpafe.felica_polling(pasori, FELICA_POLLING_ANY, 0, 0)
            idm = c_ulonglong() 
            libpafe.felica_get_idm.restype = c_void_p
            libpafe.felica_get_idm(felica, byref(idm))
            idm_No = "%016X" % idm.value
            i=GPIO.input(PIN)
            
            file=open('idm_list.txt','r')
            
            for line in file:
               f=file.read(16) #16文字読み込む（idmのみ）
               if (idm_No == f):
                     door()
            file.close()            
#            print(idm_No)
    except KeyboardInterrupt:
        print('finished')
        file.close()
        libpafe.free(felica)
        libpafe.pasori_close(pasori)
        GPIO.cleanup() 
