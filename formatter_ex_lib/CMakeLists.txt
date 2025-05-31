cmake_minimum_required(VERSION 3.10)
project(formatter_ex_lib)

# Добавляем библиотеку
add_library(formatter_ex_lib STATIC formatter_ex.cpp)

# Указываем пути к заголовочным файлам
target_include_directories(formatter_ex_lib PUBLIC
    ${CMAKE_CURRENT_SOURCE_DIR}
    ${CMAKE_SOURCE_DIR}/formatter_lib
    ${CMAKE_SOURCE_DIR}/include
)

# Линкуем зависимые библиотеки
target_link_libraries(formatter_ex_lib PRIVATE formatter_lib)
