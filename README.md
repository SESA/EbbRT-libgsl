#EbbRT-libgsl

EbbRT port of libgsl

1. Modified config.sub and added -ebbrt flag so that the cross compiler builds correctly

2. Next run: ./configure CC=x86_64-pc-ebbrt-gcc --host=x86_64-pc-ebbrt --enable-static --disable-shared --disable-dependency-tracking

3. For some reason, the strdup.c file in utils/ do not built correctly, since it tries to link in strdup.o to a libtool binary but this only works if it built strdup.lo first. I modified the utils/Makefile so that it builds strdup.lo first by changing all mentions of strdup.o with strdup.lo
   The right way to fix this is to figure out why the Makefile is "broken", I'm unsure if the issue is with the toolchain or the Makefile.

   The error we saw was similar to this (ftp://ftp.gnu.org/old-gnu/Manuals/libtool/html_chapter/libtool_3.html):
   libtool gcc -g -O -o libhello.la foo.o hello.o
   libtool: cannot build libtool library `libhello.la' from non-libtool objects
   The reason we get this error is because we are trying to build libtool from standard objects instead of library objects.
   So the solution to this is to first build strdup.lo instead of strdup.o and pass strdup.lo to building libutils.la

4. After this I did make and it built the two libraries that we needed for EbbRT: libgsl.a libgslcblas.a
   This build will error out towards the end at building testing code, due to the ebbrt toolchain not supporting certain functions. This is fine for now since the libraries we need are already built.



