cmake_minimum_required(VERSION 3.26)

project(C)

add_library(
    C
    c.h
    c.cpp)

target_sources(C
    PUBLIC
    FILE_SET headers
    TYPE HEADERS
    BASE_DIRS "${CMAKE_CURRENT_SOURCE_DIR}"
    FILES
        "${CMAKE_CURRENT_SOURCE_DIR}/c.h")

install(TARGETS C FILE_SET headers)
