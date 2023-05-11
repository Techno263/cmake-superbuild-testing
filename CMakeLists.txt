cmake_minimum_required(VERSION 3.26)

include(ExternalProject)

project(foo_superbuild)

set(CMAKE_MODULE_PATH
    "${CMAKE_CURRENT_SOURCE_DIR}/cmake"
    ${CMAKE_CURRENT_SOURCE_DIR})
set(EXTERNAL_PROJECT_INSTALL_DIR "${CMAKE_CURRENT_BINARY_DIR}/external")
set(EXTERNAL_PROJECT_ARGS
    "-DCMAKE_BUILD_TYPE:STRING=${CMAKE_BUILD_TYPE}"
    "-DBUILD_SHARED_LIBS:BOOL=${BUILD_SHARED_LIBS}")

include(External_A)
include(External_B)
include(External_C)
include(External_Foo)
