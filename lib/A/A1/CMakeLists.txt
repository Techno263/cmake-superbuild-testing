set(SOURCE_DIR "${CMAKE_CURRENT_SOURCE_DIR}/src")

add_library(
    A1
    "${SOURCE_DIR}/a1/a1.h"
    "${SOURCE_DIR}/a1/a1.cpp")

target_sources(A1
    PUBLIC
    FILE_SET headers
    TYPE HEADERS
    BASE_DIRS "${SOURCE_DIR}"
    FILES
        "${SOURCE_DIR}/a1/a1.h")

install(TARGETS A1 FILE_SET headers)
