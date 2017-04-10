# Build a static library for the EbbRT native platform
cmake_minimum_required(VERSION 2.6)
project("ebbrt-libgsl" C CXX)
include(${CMAKE_SOURCE_DIR}/src_list.cmake)
include_directories( ${GSL_SOURCE_DIR}/ ${GSL_SOURCE_DIR}/build/)
add_library(gsl STATIC ${GSL_SOURCES})
