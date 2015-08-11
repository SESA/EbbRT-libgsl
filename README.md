#EbbRT-libgsl

EbbRT port of libgsl

1. Modified config.sub and added -ebbrt flag so that the cross compiler builds correctly

2. Next run: ./configure CC=x86_64-pc-ebbrt-gcc --host=x86_64-pc-ebbrt --enable-static --disable-shared --disable-dependency-tracking

3. For some reason, the strdup.c file in utils/ do not built correctly, since it tries to link in strdup.o to a libtool binary but this only works if it built strdup.lo first. I modified the utils/Makefile so that it builds strdup.lo first

4. After this I did make and it built the two libraries that we needed for EbbRT: libgsl.a libgslcblas.a



