# オートロック

## GPIO など

リセットボタン（未実装）GPIO 27  
リードスイッチ GPIO 3  
開錠ボタン GPIO 9  
施錠ボタン GPIO 2  
サーボモーター（上側）GPIO 19  
サーボモーター（下側）GPIO 6  
モーター電源用リレー　 GPIO 22

## 運用方法・注意事項

<ins>**1.old_version(鍵・モーター直結型)**</ins>

- 鍵に直接モーターを取り付けて制御する方式である
  ソースは old_version 以下

- lock.sh を crontab に記述すれば、起動時に実行されるようになる

- main.py を実行すればオートロックが起動するが、sudo で実行する必要がある

- main.py は C 言語で記述された関数を呼び出しているので、C ディレクトリ内のプログラムを使用する

- ferica 登録は　 read_idm.py 　を実行する、その際他のプログラムなどで
  カードーリーダーを使用していると読み取りができないため全て停止させてから
  読み取りを行う

- 読み取られた idm は idm_list.txt に登録され、プログラムもそのリストから読み出す

- idm_list.txt の一行目がなぜか読み取られないので二行目以降に記述

<ins>**2.gear_version(ギアボックス付きの制御機構)**</ins>

- 施錠・解錠を手動でも行えるようにギアボックス付きのオートロックを追加した
  ソースは `gear_version` 以下

- **セットアップ**
下記コマンドを実行すれば以下の処理や設定が全て行われる
```
cd gear_version
sudo setup.sh
```

- 依存関係`pigpio`,`mosquitto`,`libmosquitto-dev`  
  json は[nlohmann/json](https://github.com/nlohmann/json)ライブラリを使用

- `/etc/mosquitto/mosquitto.conf`を変更し、mqtt のポート設定と外部からのアクセス許可をする

- コンパイル：
  src 直下で `make` とすればバイナリが生成される、以下のコマンドを実行しても良い  
```  
g++ -o autolock autolock.cpp control_servo.cpp min_mqtt.cpp -lpigpiod_if2 -lmosquitto -Ijson/include
```
  autolock.cpp を`control_servo.cpp`,`min_mqtt.cpp`,`nlohmann/json`,`pigpiod_if2`,`mosquitto`のライブラリとリンクする

- systemd に autolock のプログラムを登録し自動起動を設定する
  Unit ファイルは`gear_version/src/service/autolock.service`である
  git cloneしたディレクトリに修正する必要あり

- サーボモーター MG996R の使用を前提としたギアボックスの 3DCAD データ(stl 形式)は 3D_Models 以下にある

- Eagle で作成した基板データ（board・schematic）は Board_data 以下にある

- mqtt でメッセージを送ることでも、施錠・開錠が可能である  
  現バージョンでは指定したトピックに"1"というメッセージを送ると動作する  
  バイナリがあるディレクトリの`autolock_setting.json`に各種設定を書き込む

- 作者の環境ではラズパイとモーターの電源は別で取っているので、モーターの動作が不安定になった場合に備えリレーで電源を制御している
  reray_on.cpp/reray_off.cpp でそれぞれ電源の入切が可能である
