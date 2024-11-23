# オートロック

リードセンサーを使用しないブランチ

## GPIO など

リセットボタン（未実装）GPIO 27  
リードスイッチ GPIO 3  
開錠ボタン GPIO 9  
施錠ボタン GPIO 2  
サーボモーター（上側）GPIO 19  
サーボモーター（下側）GPIO 6  
モーター電源用リレー　 GPIO 22

## 運用方法・注意事項

<ins>**1.direct_version(鍵・モーター直結型)**</ins>

- 鍵に直接モーターを取り付けて制御する方式である
  ソースは direct_version 以下

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
mkdir build
cd build
cmake ..
make
cd ..
sudo setup.sh
```

- **依存関係**  
  `pigpio`,`mosquitto`,`libmosquitto-dev`,`libcurl4-openssl-dev`  
  json は[nlohmann/json](https://github.com/nlohmann/json)ライブラリを使用  
  curl は LINE,Slack の API で使用するため、API を使用しない場合は不要

- **実行ファイル**  
  バイナリは`gear_version/bin`に生成される  
  systemd に autolock のプログラムを登録することで自動起動させることができる  
  Unit ファイルは`gear_version/service/autolock.service`である  
  実行プログラムのパスをバイナリのあるディレクトリに修正する必要あり

- **設定関係**  
  `gear_version/etc/autolock_setting.json`で各種設定を行う  
  以下の各項目について設定が可能である  
  MQTT は開錠・施錠・リレー制御のトピック、メッセージ、mqtt ポート、ブローカー ip  
  LINE はチャンネルのアクセストークン、送信先ユーザー ID  
  Slack はチャンネルのアクセストークン、送信先のチャンネル名  
  `/etc/mosquitto/mosquitto.conf`を変更し、mqtt のポート設定と外部からのアクセス許可をする必要あり

- **ライブラリ**  
  外部ライブラリとして`nlohmann/json`,`pigpiod_if2`,`mosquitto`  
  独自ライブラリとして`control_servo`,`min_mqtt`,`autolock_setting`,`line_api`,`slack_api`がある、これらはビルドすると`gear_version/lib`内に配置される  
  `line_api`,`slack_api`は LINE と Slack に通知をするライブラリである

- **テストコード**  
  各種テストコードのビルド先はビルドディレクトリの`src/test_code`内  
  `line_test`と`slack_test`はアクセストークンと送信先をソース内を変更して設定する必要がある  
  `gear_version/src/test_code`内にすべてのソースコードがある  
  作者の環境ではラズパイとモーターの電源は別で取っているので、モーターの動作が不安定になった場合に備えリレーで電源を制御している  
  `reray_on`,`reray_off` でそれぞれ電源の入切が可能である

- サーボモーター MG996R の使用を前提としたギアボックスの 3DCAD データ(stl 形式)は 3D_Models 以下にある

- Eagle で作成した基板データは pcb_data 以下にある([説明](https://github.com/takuteh/autolock/blob/main/pcb_data/READMD.md))

## ディレクトリ構成
※一部省略
<pre>
autolock/
├── 3D_Models
│   └── ...
├── pcb_data
│   └── ...
├── README.md
├── direct_version
│   ├── C
│   │   ├── Makefile
│   │   ├── close.c
│   │   └── open.c
│   ├── C++
│   │   ├── src
│   │   │   ├── auto_lock.cpp
│   │   │   ├── auto_lock.hpp
│   │   │   ├── switch.cpp
│   │   │   └── switch.hpp
│   │   ├── test
│   │   └── test.cpp
│   ├── Python
│   │   ├── direct_lock.service
│   │   ├── main.py
│   │   └── read_idm.py
│   └── README.txt
└── gear_version
    ├── CMakeLists.txt             :全体のビルド用
    ├── etc
    │   └── autolock_setting.json :設定ファイル
    ├── include                 
    │   ├── autolock_setting.h
    │   ├── control_servo.h
    │   ├── line_api.h
    │   ├── min_mqtt.h
    │   └── slack_api.h
    ├── service
    │   └── autolock.service    :systemdのserviceファイル
    ├── setup.sh                 :初回ビルド前に実行するスクリプト
    └── src
        ├── autolock.cpp         :メインのコード
        ├── autolock_setting.cpp :設定ファイルの読込
        ├── control_servo.cpp    :サーボモーター制御
        ├── line_api.cpp         :LINEへ送信する
        ├── min_mqtt.cpp         :MQTT関連の制御・設定
        ├── slack_api.cpp        :Slackへ送信
        ├── test_code            :デバッグ用コード
        │   ├── CMakeLists.txt  :test_codeのビルド用
        │   ├── down_close.c
        │   ├── down_open.c
        │   ├── line_test.cpp
        │   ├── read_sw.cpp
        │   ├── relay_off.cpp
        │   ├── relay_on.cpp
        │   ├── slack_test.cpp
        │   ├── up_close.c
        │   └── up_open.c
        └── wiringPi_ver
            ├── home_close.c
            ├── home_open.c
            └── lock_open.c
</pre>
