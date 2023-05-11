cmake_minimum_required(VERSION 3.26)

project(B)

set(SOURCE_DIR "${CMAKE_CURRENT_SOURCE_DIR}/src")

find_package(
    A
    REQUIRED
    COMPONENTS A1)

add_library(
    B
    "${SOURCE_DIR}/b.h"
    "${SOURCE_DIR}/b.cpp")

target_sources(B
    PUBLIC
    FILE_SET headers
    TYPE HEADERS
    BASE_DIRS "${SOURCE_DIR}"
    FILES
        "${SOURCE_DIR}/b.h")

#target_include_directories(B PRIVATE ${A_A1_INCLUDE_DIR})
target_include_directories(B PRIVATE ${A_INCLUDE_DIRS})
target_link_libraries(A::A1)

install(TARGETS B FILE_SET headers)
