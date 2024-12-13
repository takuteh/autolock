import pigpio
import time

# サーボモーターをGPIOの18につないで使います
servo = 19

pi = pigpio.pi()

# ピンを出力に設定
pi.set_mode(servo, pigpio.OUTPUT)

# 2秒間正転 (FS90Rは1msのパルスで正転)
pi.set_servo_pulsewidth(servo, 1000)

time.sleep(2)

# 2秒間逆転 (FS90Rは2msのパルスで逆転)
pi.set_servo_pulsewidth(servo, 2000)

time.sleep(2)

# 停止 (FS90Rは1.5msのパルスで停止)
pi.set_servo_pulsewidth(servo, 1500)

# 終了
pi.stop()
