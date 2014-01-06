
QT       += core

QT       -= gui

TARGET = flex-bison-toy
CONFIG   += console
CONFIG   -= app_bundle

TEMPLATE = app


FLEX_SOURCES = lexer.l

BISON_SOURCES = parser.y


OTHER_FILES += \
    $$FLEX_SOURCES \
    $$BISON_SOURCES



SOURCES +=

HEADERS += 



DEFINES += __STDC_LIMIT_MACROS __STDC_CONSTANT_MACROS

bisonsource.input = BISON_SOURCES

bisonsource.output = ${QMAKE_FILE_BASE}.cpp

bisonsource.commands = bison -d --defines=${QMAKE_FILE_BASE}.h -o ${QMAKE_FILE_BASE}.cpp ${QMAKE_FILE_IN}

bisonsource.variable_out = SOURCES

bisonsource.name = Bison Sources ${QMAKE_FILE_IN}

bisonsource.CONFIG += target_predeps

QMAKE_EXTRA_COMPILERS += bisonsource

bisonheader.input = BISON_SOURCES

bisonheader.output = ${QMAKE_FILE_BASE}.h

bisonheader.commands = @true

bisonheader.variable_out = HEADERS

bisonheader.name = Bison Headers ${QMAKE_FILE_IN}

bisonheader.CONFIG = target_predeps no_link

QMAKE_EXTRA_COMPILERS += bisonheader



flexsource.input = FLEX_SOURCES
flexsource.output = ${QMAKE_FILE_BASE}.cpp

flexsource.commands = flex --header-file=${QMAKE_FILE_BASE}.h -o ${QMAKE_FILE_BASE}.cpp ${QMAKE_FILE_IN}

flexsource.variable_out = SOURCES

flexsource.name = Flex Sources ${QMAKE_FILE_IN}

flexsource.CONFIG += target_predeps

QMAKE_EXTRA_COMPILERS += flexsource

flexheader.input = FLEX_SOURCES

flexheader.output = ${QMAKE_FILE_BASE}.h

flexheader.commands = @true

flexheader.variable_out = HEADERS

flexheader.name = Flex Headers ${QMAKE_FILE_IN}

flexheader.CONFIG += target_predeps no_link

QMAKE_EXTRA_COMPILERS += flexheader



#unix:!macx: LIBS += -lfl -ly -lllvm

#unix:!macx: LIBS += -lfl -ly $$system(llvm-config --libs)

unix:!macx: LIBS += -lfl -ly


#win32:CONFIG(release, debug|release): LIBS += -L$$PWD/../../../../../usr/lib/llvm-3.4/lib/release/ -lLLVM-3
#else:win32:CONFIG(debug, debug|release): LIBS += -L$$PWD/../../../../../usr/lib/llvm-3.4/lib/debug/ -lLLVM-3
#else:unix: LIBS += -L$$PWD/../../../../../usr/lib/llvm-3.4/lib/ -lLLVM-3


#INCLUDEPATH += $$PWD/../../../../../usr/lib/llvm-3.4/include
#DEPENDPATH += $$PWD/../../../../../usr/lib/llvm-3.4/include
