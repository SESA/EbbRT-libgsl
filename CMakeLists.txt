# Build a static library for the EbbRT native platform
cmake_minimum_required(VERSION 2.6)
set( GSL_SOURCE_DIR "(${CMAKE_CURRENT_SOURCE_DIR}/gsl-1.0")
project("ebbrt-libgsl" C CXX)
include(${CMAKE_CURRENT_SOURCE_DIR}/src_list.cmake)
include_directories(${GSL_SOURCE_DIR})
add_library(gsl STATIC ${GSL_SOURCES})
