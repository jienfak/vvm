<mkconfig

SRC = `{ ls *.c }
OBJ = ${SRC:%.c=%.o}
HDR = `{ ls *.h }
TGT = $NAME

all :VQ: $TGT
	echo -n
$TGT : $OBJ
	$LD $LDFLAGS -o $target $prereq
%.o : %.c
	$CC $CFLAGS $CPPFLAGS -c -o $target $prereq
%.c :Q: $HDR
	touch $target
%.h :Q:
	touch $target
install : $TGT
	cp -f $TGT $BIN
	chmod 0755 $BIN/$TGT 
uninstall: 
	rm -f $BIN/$TGT
clean :
	rm -rf $TGT *.o 
