cmake_minimum_required(VERSION 3.13)
project(test_code)

enable_language(C)
enable_language(CXX)

get_filename_component(CURRENT_DIR "${CMAKE_SOURCE_DIR}" ABSOLUTE)
find_library(PIGPIO pigpiod_if2)
find_library(CURL curl)

# 出力ディレクトリを設定
#set(CMAKE_RUNTIME_OUTPUT_DIRECTORY ${CURRENT_DIR}/../bin)


# 各ターゲットを定義してリンク
#サーボモーター右回しテスト　GPIO_19
add_executable(up_open up_open.c)
target_link_libraries(up_open ${PIGPIO})

#サーボモーター左回しテスト　GPIO_19
add_executable(up_close up_close.c)
target_link_libraries(up_close ${PIGPIO})

#サーボモーター右回しテスト　GPIO_6
add_executable(down_open down_open.c)
target_link_libraries(down_open ${PIGPIO})
#サーボモーター左回しテスト　GPIO_6
add_executable(down_close down_close.c)
target_link_libraries(down_close ${PIGPIO})

#サーボモーター用リレースイッチテスト GPIO_22
add_executable(relay_on relay_on.cpp)
target_link_libraries(relay_on ${PIGPIO})

#ドア開閉用リードセンサーテスト GPIO_3
add_executable(read_sw read_sw.cpp)
target_link_libraries(read_sw ${PIGPIO})

#LINE送信テスト
add_executable(line_test line_test.cpp ../line_api.cpp)
target_link_libraries(line_test ${CURL})

#slack送信テスト
add_executable(slack_test slack_test.cpp ../slack_api.cpp)
target_link_libraries(slack_test ${CURL})

include_directories(../../include)
