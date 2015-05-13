UNAME_S := $(shell uname -s)
ifeq ($(UNAME_S),Linux)
	OUTFILE = libNailgunTest.so
	CCFLAGS = -fPIC -I${JAVA_HOME}/include -I${JAVA_HOME}/include/linux
endif
ifeq ($(UNAME_S),Darwin)
	OUTFILE = libNailgunTest.jnilib
	CCFLAGS = -I$(/usr/libexec/java_home)/include -I$(/usr/libexec/java_home)/include/darwin
endif

install: bin/$(OUTFILE) closure-compiler nailgun

bin/$(OUTFILE):
	cd bin && javac NailgunTest.java && gcc NailgunTest.c -shared -o $(OUTFILE) $(CCFLAGS)

closure-compiler:
	rm -fr temp
	mkdir temp
	cd temp && curl -O https://dl.google.com/closure-compiler/compiler-latest.zip && unzip compiler-latest.zip
	mkdir closure-compiler
	mv temp/compiler.jar closure-compiler
	rm -fr temp

nailgun:
	rm -fr temp
	mkdir temp
	cd temp && curl -OL https://github.com/martylamb/nailgun/archive/master.tar.gz && tar -xf master.tar.gz
	sed -e 's/<source>1.4</source>/<source>1.8</source>/g' temp/nailgun-master/pom.xml
	sed -e 's/<target>1.4</target>/<target>1.8</target>/g' temp/nailgun-master/pom.xml
	cd temp/nailgun-master && make ng && cd nailgun-server && mvn package
	mkdir nailgun
	mv temp/nailgun-master/nailgun-server/target/nailgun-server-0.9.2.jar nailgun/nailgun.jar
	mv temp/nailgun-master/ng nailgun/ng
	rm -fr temp

clean:
	rm -rf bin/$(OUTFILE) bin/NailgunTest.class closure-compiler nailgun temp
