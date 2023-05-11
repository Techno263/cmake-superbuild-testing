set(SOURCE_DIR "${CMAKE_CURRENT_SOURCE_DIR}/src")

add_library(
    A2
    "${SOURCE_DIR}/a2/a2.h"
    "${SOURCE_DIR}/a2/a2.cpp")

target_sources(A2
    PUBLIC
    FILE_SET headers
    TYPE HEADERS
    BASE_DIRS "${SOURCE_DIR}"
    FILES
    "${SOURCE_DIR}/a2/a2.h")

target_link_libraries(A2 A1)

install(TARGETS A2 FILE_SET headers)
