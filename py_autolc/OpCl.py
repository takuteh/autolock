import RPi.GPIO as gpio
import time

servo_pin=19
gpio.setmode(gpio.BCM)
gpio.setup(servo_pin,gpio.OUT)
servo=gpio.PWM(servo_pin,50)
servo.start(0)

class opcl():
    
    
    
    def servo_angle(angle):
        duty=2.5+(12.0-2.5)*(angle+90)/180
        servo.ChangeDutyCycle(duty)
        time.sleep(0.3)

    def open(self):
        opcl.servo_angle(80)
        

    def close(self):
        opcl.servo_angle(-100)
        


if __name__=="__main__":
    oc=opcl()
    oc.open()
    time.sleep(1)
    oc.close()
    gpio.cleanup()

