find . | grep Makefile.am | cut -d '/' -f 1,2 | while read dir; do cat /Makefile.am | grep _la_SOURCES | cut -d ' ' -f 3- | while read line; do for file in ; do echo /; done; done; done 


#https://github.com/SESA/fetalReconstruction/blob/master/source/CMakeLists_CPU.cmake
