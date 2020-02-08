#########################
# Qlibxlsxwriter.pri
#

# for Visual C++
msvc:QMAKE_CXXFLAGS += /utf-8

# set paths(directories) of Qlibxlsxwriter (or, use default path)
isEmpty(QLIBXLSXWRITER_PARENTPATH) {
    message( 'QLIBXLSXWRITER_PARENTPATH is empty. use default value.' )
    QLIBXLSXWRITER_PARENTPATH = ../libxlsxwriter/
} else {
    message( 'QLIBXLSXWRITER_PARENTPATH :' )
    message( $${QLIBXLSXWRITER_PARENTPATH} )
}

#########################
# xlsxwriter

INCLUDEPATH += \
$${QLIBXLSXWRITER_PARENTPATH}/include/

HEADERS += \
$${QLIBXLSXWRITER_PARENTPATH}/include/xlsxwriter.h

HEADERS += \
$${QLIBXLSXWRITER_PARENTPATH}/include/xlsxwriter/app.h \
$${QLIBXLSXWRITER_PARENTPATH}/include/xlsxwriter/chart.h \
$${QLIBXLSXWRITER_PARENTPATH}/include/xlsxwriter/chartsheet.h \
$${QLIBXLSXWRITER_PARENTPATH}/include/xlsxwriter/comment.h \
$${QLIBXLSXWRITER_PARENTPATH}/include/xlsxwriter/common.h \
$${QLIBXLSXWRITER_PARENTPATH}/include/xlsxwriter/content_types.h \
$${QLIBXLSXWRITER_PARENTPATH}/include/xlsxwriter/core.h \
$${QLIBXLSXWRITER_PARENTPATH}/include/xlsxwriter/custom.h \
$${QLIBXLSXWRITER_PARENTPATH}/include/xlsxwriter/drawing.h \
$${QLIBXLSXWRITER_PARENTPATH}/include/xlsxwriter/format.h \
$${QLIBXLSXWRITER_PARENTPATH}/include/xlsxwriter/hash_table.h \
$${QLIBXLSXWRITER_PARENTPATH}/include/xlsxwriter/packager.h \
$${QLIBXLSXWRITER_PARENTPATH}/include/xlsxwriter/relationships.h \
$${QLIBXLSXWRITER_PARENTPATH}/include/xlsxwriter/shared_strings.h \
$${QLIBXLSXWRITER_PARENTPATH}/include/xlsxwriter/styles.h \
$${QLIBXLSXWRITER_PARENTPATH}/include/xlsxwriter/theme.h \
$${QLIBXLSXWRITER_PARENTPATH}/include/xlsxwriter/utility.h \
$${QLIBXLSXWRITER_PARENTPATH}/include/xlsxwriter/vml.h \
$${QLIBXLSXWRITER_PARENTPATH}/include/xlsxwriter/workbook.h \
$${QLIBXLSXWRITER_PARENTPATH}/include/xlsxwriter/worksheet.h \
$${QLIBXLSXWRITER_PARENTPATH}/include/xlsxwriter/xmlwriter.h

SOURCES += \
$${QLIBXLSXWRITER_PARENTPATH}/src/app.c \
$${QLIBXLSXWRITER_PARENTPATH}/src/chart.c \
$${QLIBXLSXWRITER_PARENTPATH}/src/chartsheet.c \
$${QLIBXLSXWRITER_PARENTPATH}/src/comment.c \
$${QLIBXLSXWRITER_PARENTPATH}/src/content_types.c \
$${QLIBXLSXWRITER_PARENTPATH}/src/core.c \
$${QLIBXLSXWRITER_PARENTPATH}/src/custom.c \
$${QLIBXLSXWRITER_PARENTPATH}/src/drawing.c \
$${QLIBXLSXWRITER_PARENTPATH}/src/format.c \
$${QLIBXLSXWRITER_PARENTPATH}/src/hash_table.c \
$${QLIBXLSXWRITER_PARENTPATH}/src/packager.c \
$${QLIBXLSXWRITER_PARENTPATH}/src/relationships.c \
$${QLIBXLSXWRITER_PARENTPATH}/src/shared_strings.c \
$${QLIBXLSXWRITER_PARENTPATH}/src/styles.c \
$${QLIBXLSXWRITER_PARENTPATH}/src/theme.c \
$${QLIBXLSXWRITER_PARENTPATH}/src/utility.c \
$${QLIBXLSXWRITER_PARENTPATH}/src/vml.c \
$${QLIBXLSXWRITER_PARENTPATH}/src/workbook.c \
$${QLIBXLSXWRITER_PARENTPATH}/src/worksheet.c \
$${QLIBXLSXWRITER_PARENTPATH}/src/xmlwriter.c

#########################
# third party : minizip, tmpfileplus, md5

INCLUDEPATH += \
$${QLIBXLSXWRITER_PARENTPATH}/include/xlsxwriter/third_party/

#
# tmpfileplus

HEADERS += \
$${QLIBXLSXWRITER_PARENTPATH}/third_party/tmpfileplus/tmpfileplus.h

SOURCES += \
$${QLIBXLSXWRITER_PARENTPATH}/third_party/tmpfileplus/tmpfileplus.c

#
# minizip

INCLUDEPATH += \
$${QLIBXLSXWRITER_PARENTPATH}/third_party/minizip/

HEADERS += \
$${QLIBXLSXWRITER_PARENTPATH}/third_party/minizip/zip.h \
$${QLIBXLSXWRITER_PARENTPATH}/third_party/minizip/unzip.h \
$${QLIBXLSXWRITER_PARENTPATH}/third_party/minizip/ioapi.h \
$${QLIBXLSXWRITER_PARENTPATH}/third_party/minizip/crypt.h

SOURCES += \
$${QLIBXLSXWRITER_PARENTPATH}/third_party/minizip/zip.c \
$${QLIBXLSXWRITER_PARENTPATH}/third_party/minizip/unzip.c \
$${QLIBXLSXWRITER_PARENTPATH}/third_party/minizip/ioapi.c

#
# md5

HEADERS += \
$${QLIBXLSXWRITER_PARENTPATH}/third_party/md5/md5.h

SOURCES += \
$${QLIBXLSXWRITER_PARENTPATH}/third_party/md5/md5.c

########################################
# Setting development environment for 
#  various compiler and operating system
######################################## 

# https://github.com/j2doll/Qlibxlsxwriter/issues/4#issue-371996348
# Recommendations from liufeijin
# If you install with qt5 scr , only add this in your project file pro
# INCLUDEPATH += $$[QT_INSTALL_HEADERS]/QtZlib

linux-g++ | linux-g++-64 | linux-g++-32 {
    # linux gcc

    # Install programs :
    #  gcc and essential build tool, zlib for development, Qt5

    # zlib
    HEADERS += zlib.h
    LIBS += -lz

    message('current type is linux-g++')
}
linux-clang {
    # linux(or mac os) clang

    # zlib
    HEADERS += zlib.h
    LIBS += -lz    

    message('current type is linux-clang')
}
win32-g++ {
    # MingW / MSYS / CygWin

    DEFINES += USE_FILE32API

    QMAKE_CFLAGS += -static
    QMAKE_CFLAGS += -static-libgcc
    QMAKE_CFLAGS += -Wno-char-subscripts
    QMAKE_CFLAGS += -Wno-long-long

    # zlib
    HEADERS += zlib.h
    LIBS += -lz

    # Settings for MSYS2 with Qt5
    # Install the dev tools for libxlsxwriter.
    # pacman -S mingw-w64-x86_64-toolchain git gcc make zlib-devel
    # See https://github.com/j2doll/Qlibxlsxwriter/issues/1.    

    message('current type is win32-g++')
}
win32-msvc* {
    # Visual C++
    HEADERS += \
    $${QLIBXLSXWRITER_PARENTPATH}/third_party/minizip/iowin32.h

    SOURCES += \
    $${QLIBXLSXWRITER_PARENTPATH}/third_party/minizip/iowin32.c

    # zlib
    HEADERS += zlib.h

    # How to install zlib for msvc easily.
    # 1) Open *.pro from Visual Studio(VS2017).
    #   - Visual Studio Menu : 'Qt VS Tools' -> 'Open Qt Project file (.pro)'
    # 2) Save Visual Studio Solution file (*.sln)
    # 3) Install zlib-msvc-x64 for Visual Studio 2017+64bit
    #    - Visual Studio Menu : 'Tools' -> 'NuGet Package Manager' -> 'Package Manager Console'
    #    - type 'Install-Package zlib-msvc-x64' on Package Manager Console.

    # Notice>
    # If your Windows language does not compile with theme.c, 
    # Then fix theme.c and compile. 

    message('current type is win32-msvc*')
}

