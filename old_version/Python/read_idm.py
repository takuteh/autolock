# -*- coding: utf-8 -*-
 
from __future__ import print_function
from ctypes import *
 
# libpafe.hの77行目で定義
FELICA_POLLING_ANY = 0xffff
     
libpafe = cdll.LoadLibrary("/usr/local/lib/libpafe.so")
 
libpafe.pasori_open.restype = c_void_p
pasori = libpafe.pasori_open()
libpafe.pasori_init(pasori)
libpafe.felica_polling.restype = c_void_p

try:
       while True:
         felica = libpafe.felica_polling(pasori, FELICA_POLLING_ANY, 0, 0)
         idm = c_ulonglong() #←16桁受けとるために変更
         libpafe.felica_get_idm.restype = c_void_p
         libpafe.felica_get_idm(felica, byref(idm))
         idm_No="%016X" % idm.value
         # IDmは16進表記
         #print(idm_No)
         if(idm_No!='0000000000000000'):
            #while(idm_No!='0000000000000000'): 
            get_idm=idm_No #←16桁表示させるために変更
            print("idm:",get_idm)
            while True:
               ans=input("idm ok?:y or n:")
               if(ans=="n"):
                  print("touch the card again!")
                  break
               elif(ans=="y"):
                  file=open('idm_list.txt','r')
                  for line in file:
                    f=file.read(16)
                    if(f==idm_No):
                       print("this id already exists!")
                       exit()
                  file.close()
                  with open('idm_list.txt','a')as f:
                       card_name=input("input cardname:")
                       print(idm_No+" *"+card_name,file=f)
                       print("recorded in the list!")
                  exit()
               else:
                  print("input y or n!!")
except KeyboardInterrupt:
     # READMEより、felica_polling()使用後はfree()を使う
        libpafe.free(felica)
 
        libpafe.pasori_close(pasori)
