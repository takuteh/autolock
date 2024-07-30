cmake_minimum_required(VERSION 3.13)
project(test_code)

enable_language(C)
enable_language(CXX)

get_filename_component(CURRENT_DIR "${CMAKE_SOURCE_DIR}" ABSOLUTE)
find_library(PIGPIO pigpiod_if2)

# 出力ディレクトリを設定
#set(CMAKE_RUNTIME_OUTPUT_DIRECTORY ${CURRENT_DIR}/../bin)


# 各ターゲットを定義してリンク
add_executable(up_open up_open.c)
target_link_libraries(up_open ${PIGPIO})

add_executable(up_close up_close.c)
target_link_libraries(up_close ${PIGPIO})

add_executable(down_open down_open.c)
target_link_libraries(down_open ${PIGPIO})

add_executable(down_close down_close.c)
target_link_libraries(down_close ${PIGPIO})

add_executable(relay_on relay_on.cpp)
target_link_libraries(relay_on ${PIGPIO})

add_executable(relay_off relay_off.cpp)
target_link_libraries(relay_off ${PIGPIO})

