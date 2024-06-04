# オートロック
## GPIOなど
リセットボタン（未実装）GPIO 27  
リードスイッチGPIO 3  
開錠ボタン GPIO 9  
施錠ボタン GPIO 2  
サーボモーター（上側）GPIO 19  
サーボモーター（下側）GPIO 6  
モーター電源用リレー　GPIO 22  

## 運用方法・注意事項

<ins>**1.old_version(鍵・モーター直結型)**</ins>

- 鍵に直接モーターを取り付けて制御する方式である
ソースはold_version以下

- lock.shをcrontabに記述すれば、起動時に実行されるようになる

- main.pyを実行すればオートロックが起動するが、sudoで実行する必要がある

- main.pyはC言語で記述された関数を呼び出しているので、Cディレクトリ内のプログラムを使用する

- ferica登録は　read_idm.py　を実行する、その際他のプログラムなどで
カードーリーダーを使用していると読み取りができないため全て停止させてから
読み取りを行う

- 読み取られたidmはidm_list.txtに登録され、プログラムもそのリストから読み出す

- idm_list.txtの一行目がなぜか読み取られないので二行目以降に記述

<ins>**2.gear_version(ギアボックス付きの制御機構)**</ins>
- 施錠・解錠を手動でも行えるようにギアボックス付きのオートロックを追加した
ソースはgear_version以下

- 依存関係"pigpio","mosquitto","libmosquitto-dev"  
jsonは[nlohmann/json](https://github.com/nlohmann/json)ライブラリを使用

- autolock.cppを"control_servo.cpp","min_mqtt.cpp","nlohmann/json","pigpiod_if2","mosquitto"のライブラリとリンクする

- コンパイルコマンド：
src直下でmakeとすればバイナリが生成される、以下のコマンドを実行しても良い  
"g++ -o autolock autolock.cpp control_servo.cpp min_mqtt.cpp -lpigpiod_if2 -lmosquitto -Ijson/include"

- systemdにautolockのプログラムを登録し自動起動を設定する
Unitファイルは"gear_version/src/service/autolock.service"である

- サーボモーターMG996Rの使用を前提としたギアボックスの3DCADデータ(stl形式)は3D_Models以下にある

- Eagleで作成した基板データ（board・schematic）はBoard_data以下にある

- mqttでメッセージを送ることでも、施錠・開錠が可能である  
現バージョンでは指定したトピックに"1"というメッセージを送ると動作する  
バイナリがあるディレクトリの"autolock_setting.json"に各種設定を書き込む

- 作者の環境ではラズパイとモーターの電源は別で取っているので、モーターの動作が不安定になった場合に備えリレーで電源を制御している
  reray_on.cpp/reray_off.cppでそれぞれ電源の入切が可能である
