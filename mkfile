<mkconfig

VERSION = 6.2
CPPFLAGS = -DVERSION=\"$VERSION\"
CFLAGS = -I$X11R6/include -I/usr/include/freetype2
LDFLAGS = -L$X11R6/include -lX11 -lfontconfig -lXft

SRC = `{ ls *.c }
OBJ = ${SRC:%.c=%.o}
HDR = `{ ls *.h }
TGT = xvvm

all :VQ: $TGT
	echo -n
$TGT : $OBJ
	$LD $LDFLAGS -o $target $prereq
%.o : %.c
	$CC $ADDFLAGS $CFLAGS $CPPFLAGS -c -o $target $prereq
%.c :Q: $HDR
	echo -n
%.h :Q:
	echo -n
install : $TGT
	cp -f $TGT $ROOT/bin/
	chmod 0755 $ROOT/bin/$TGT 
uninstall: 
	rm -f $ROOT/share/man/man1/$TGT.1 $ROOT/bin/$TGT
clean :
	rm -rf $TGT *.o 