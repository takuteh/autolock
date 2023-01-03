from __future__ import print_function
from ctypes import *
import RPi.GPIO as GPIO 
import OpCl
import time

oc=OpCl.opcl()
def door():
                oc.open()
                time.sleep(4)
                while True:
                 m=GPIO.input(PIN_RSW)
                 if m==0:
                  time.sleep(0.8)
                  oc.close()            
                  break

def callback(PIN):
 door()               
               

PIN=9
PIN_RSW=3
GPIO.setmode(GPIO.BCM)
GPIO.setup(PIN_RSW,GPIO.IN,GPIO.PUD_DOWN)
GPIO.setup(PIN,GPIO.IN,GPIO.PUD_DOWN)


GPIO.add_event_detect(PIN,GPIO.RISING,bouncetime=300)
GPIO.add_event_callback(PIN,callback)



# libpafe.hの77行目で定義
FELICA_POLLING_ANY = 0xffff
 
#許可するidm番号を設定
allow_idm_list = ['30511C8312011201']
 
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
            #print(idm_No)
            
            if (idm_No in allow_idm_list):
               door()
            #elif idm_No == '0000000000000000':
             #   print('カードをタッチしてください')
            #else:
              #  print('deny')
            
 
    except KeyboardInterrupt:
        print('finished')
        libpafe.free(felica)
        libpafe.pasori_close(pasori)
        GPIO.cleanup() 
