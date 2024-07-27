cmake_minimum_required(VERSION 3.13)
project(autolock CXX)

#絶対パスに変換
get_filename_component(CURRENT_DIR "${CMAKE_SOURCE_DIR}" ABSOLUTE)

find_library(PIGPIO pigpiod_if2)
find_library(MQTT mosquitto)

#生成ライブラリの出力先
set(CMAKE_LIBRARY_OUTPUT_DIRECTORY ${CURRENT_DIR}/lib)
set(CMAKE_ARCHIVE_OUTPUT_DIRECTORY ${CURRENT_DIR}/lib)

#生成バイナリの出力先
set(CMAKE_RUNTIME_OUTPUT_DIRECTORY ${CURRENT_DIR}/bin)

#ライブラリの生成
add_library(min_mqtt STATIC ${CMAKE_SOURCE_DIR}/src/min_mqtt.cpp)
add_library(control_servo SHARED ${CMAKE_SOURCE_DIR}/src/control_servo.cpp)

set(MY_LIBRARY min_mqtt control_servo)

#バイナリ生成
add_executable(${PROJECT_NAME} ${CMAKE_SOURCE_DIR}/src/autolock.cpp)

#設定ファイルのパスをマクロに登録
target_compile_definitions(${PROJECT_NAME} PRIVATE SETTING_FILE="${CURRENT_DIR}/etc/autolock_setting.json")

#ライブラリのリンク
target_link_libraries(${PROJECT_NAME}
	${PIGPIO}
	${MQTT}
	${MY_LIBRARY}
)

set(CMAKE_CXX_FLAGS "${CMAKE_CXX_FLAGS}")

include_directories(${CURRENT_DIR}/json/include)
include_directories(${CURRENT_DIR}/include)
link_directories(${CURRENT_DIR}/lib)

#make clean
add_custom_target(custom_clean
	COMMAND rm *.a *.so
)

#make install
install(TARGETS ${MY_LIBRARY}
		LIBRARY DESTINATION ${CURRENT_DIR}/lib
		ARCHIVE DESTINATION ${CURRENT_DIR}/lib
)

