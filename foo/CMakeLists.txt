cmake_minimum_required(VERSION 3.26)

project(foo)

add_executable(
    foo
    src/main.cpp)

find_package(A REQUIRED)
find_package(B REQUIRED)
find_package(C REQUIRED)

target_include_directories(foo
    PRIVATE
        ${A_INCLUDE_DIRS}
        ${B_INCLUDE_DIRS}
        ${C_INCLUDE_DIRS})

target_link_libraries(foo
    PRIVATE
        ${A_LIBRARIES}
        ${B_LIBRARIES}
        ${C_LIBRARIES})

install(TARGETS foo)
