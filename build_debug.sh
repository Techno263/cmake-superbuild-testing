#!/usr/bin/env sh



cmake \
    -S ./ \
    -B ./build/debug \
    -DCMAKE_BUILD_TYPE=Debug
    #-DBUILD_SHARED_LIBS=ON

#cmake --build ./build/debug --config Debug --parallel
cmake \
    --build ./build/debug \
    --config Debug
