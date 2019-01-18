TEMPLATE=app
QT-=gui

message(Touch mimeTeX qmake)

QMAKE_CFLAGS += -DAA
QMAKE_CXXFLAGS += -DAA

SOURCES=mimetex.c \
        gifsave.c \

HEADERS=mimetex.h \
        texfonts.h

        
OBJECTS_DIR = $${_PRO_FILE_PWD_}/build/obj
DESTDIR = $${_PRO_FILE_PWD_}/build/bin

# Русская кодировка в консоли
QMAKE_EXTRA_TARGETS += before_build makefilehook

makefilehook.target = $(MAKEFILE)
makefilehook.depends = .beforebuild

PRE_TARGETDEPS += .beforebuild

before_build.target = .beforebuild
before_build.depends = FORCE
before_build.commands = chcp 1251

