在代码根目录运行
nb/build_xxx.sh

*** 代码根路径不能包含空格 ***

如果遇到openssl无法编译通过，可能是由于目录中包含空格造成的
查看 auto/lib/openssl/make
查看 objs/Makefile ： 1998 

