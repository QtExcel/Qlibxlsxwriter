####################
#
#  Qlibxlsxwriter.pri
#

win32 {
    DEFINES += _WIN32
    DEFINES += WIN32
    DEFINES += WINDOWS
    message( ' OS : Microsoft Windows' )
}

isEmpty(QLIBXLSXWRITER_PARENTPATH) {
    message( 'QLIBXLSXWRITER_PARENTPATH is empty. use default value.' )
    QLIBXLSXWRITER_PARENTPATH = ../libxlsxwriter/
} else {
    message( 'QLIBXLSXWRITER_PARENTPATH :' )
    message( $${QLIBXLSXWRITER_PARENTPATH} )
}

####################
# xlsxwriter

INCLUDEPATH += \
$${QLIBXLSXWRITER_PARENTPATH}/include/

HEADERS += \
$${QLIBXLSXWRITER_PARENTPATH}/include/xlsxwriter.h

HEADERS += \
$${QLIBXLSXWRITER_PARENTPATH}/include/xlsxwriter/app.h \
$${QLIBXLSXWRITER_PARENTPATH}/include/xlsxwriter/chart.h \
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
$${QLIBXLSXWRITER_PARENTPATH}/include/xlsxwriter/workbook.h \
$${QLIBXLSXWRITER_PARENTPATH}/include/xlsxwriter/worksheet.h \
$${QLIBXLSXWRITER_PARENTPATH}/include/xlsxwriter/xmlwriter.h

SOURCES += \
$${QLIBXLSXWRITER_PARENTPATH}/src/app.c \
$${QLIBXLSXWRITER_PARENTPATH}/src/chart.c \
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
$${QLIBXLSXWRITER_PARENTPATH}/src/workbook.c \
$${QLIBXLSXWRITER_PARENTPATH}/src/worksheet.c \
$${QLIBXLSXWRITER_PARENTPATH}/src/xmlwriter.c

#########################
# third party
#  : minizip, tmpfileplus

INCLUDEPATH += \
$${QLIBXLSXWRITER_PARENTPATH}/include/xlsxwriter/third_party/

#HEADERS += \
#$${QLIBXLSXWRITER_PARENTPATH}/include/xlsxwriter/third_party/tree.h \
#$${QLIBXLSXWRITER_PARENTPATH}/include/xlsxwriter/third_party/queue.h \
#$${QLIBXLSXWRITER_PARENTPATH}/include/xlsxwriter/third_party/ioapi.h \
#$${QLIBXLSXWRITER_PARENTPATH}/include/xlsxwriter/third_party/zip.h \
#$${QLIBXLSXWRITER_PARENTPATH}/include/xlsxwriter/third_party/tmpfileplus.h

#######################
# minizip
#
# INCLUDEPATH += \
# $${QLIBXLSXWRITER_PARENTPATH}/third_party/minizip/
#
# HEADERS += \
# $${QLIBXLSXWRITER_PARENTPATH}/third_party/minizip/crypt.h \
# $${QLIBXLSXWRITER_PARENTPATH}/third_party/minizip/ioapi.h \
# $${QLIBXLSXWRITER_PARENTPATH}/third_party/minizip/iowin32.h \
# $${QLIBXLSXWRITER_PARENTPATH}/third_party/minizip/mztools.h \
# $${QLIBXLSXWRITER_PARENTPATH}/third_party/minizip/unzip.h \
# $${QLIBXLSXWRITER_PARENTPATH}/third_party/minizip/zip.h
#
# SOURCES += \
# $${QLIBXLSXWRITER_PARENTPATH}/third_party/minizip/ioapi.c \
# $${QLIBXLSXWRITER_PARENTPATH}/third_party/minizip/iowin32.c \
# $${QLIBXLSXWRITER_PARENTPATH}/third_party/minizip/miniunz.c \
# $${QLIBXLSXWRITER_PARENTPATH}/third_party/minizip/minizip.c \
# $${QLIBXLSXWRITER_PARENTPATH}/third_party/minizip/mztools.c \
# $${QLIBXLSXWRITER_PARENTPATH}/third_party/minizip/unzip.c \
# $${QLIBXLSXWRITER_PARENTPATH}/third_party/minizip/zip.c

###########
# QMiniZip (minizip alternative)



############################
# tmpfileplus

# INCLUDEPATH += \
# $${QLIBXLSXWRITER_PARENTPATH}/third_party/tmpfileplus/

HEADERS += \
$${QLIBXLSXWRITER_PARENTPATH}/third_party/tmpfileplus/tmpfileplus.h

SOURCES += \
$${QLIBXLSXWRITER_PARENTPATH}/third_party/tmpfileplus/tmpfileplus.c


