# Qlibxlsxwriter

> *Read this in other languages: [English](README.md), :kr: [한국어](README.ko.md)*

<p align="center"><img src="https://github.com/QtExcel/Qlibxlsxwriter/raw/master/markdown.data/logo.png"></p>

- Qlibxlsxwriter is a helper project that allows libxlsxwriter to be used in Qt.
- libxlsxwriter is a C library for creating Excel XLSX files. :+1:
    - Q> Can Libxlsxwriter use an existing Excel file as a template?
    - A> No. Libxlsxwriter is designed only as a file writer. It cannot read or modify an existing Excel file. See [FAQ](http://libxlsxwriter.github.io/faq.html) for more information.

## Sample (Hello World!)

```cpp
// main.cpp
//
// Qlibxlsxwriter MIT license https://github.com/QtExcel/Qlibxlsxwriter
// libxlsxwriter  FreeBSD license https://github.com/jmcnamara/libxlsxwriter

#include <QCoreApplication>

#include "xlsxwriter.h"

int main(int argc, char **argv)
{
     QCoreApplication app(argc, argv); // It is a Qt code.

     // See Tutorial 1: Create a simple XLSX file.
     // http://libxlsxwriter.github.io/tutorial01.html

     /* Some data we want to write to the worksheet. */
     struct expense {
         char item[32];
         int  cost;
     };

     struct expense expenses[] = {
         {"Rent", 1000},
         {"Gas",   100},
         {"Food",  300},
         {"Gym",    50},
     };


    /* Create a workbook and add a worksheet. */
     lxw_workbook  *workbook  = workbook_new("tutorial01.xlsx");
     lxw_worksheet *worksheet = workbook_add_worksheet(workbook, NULL);

     /* Start from the first cell. Rows and columns are zero indexed. */
     int row = 0;
     int col = 0;

     /* Iterate over the data and write it out element by element. */
     for (row = 0; row < 4; row++) {
         worksheet_write_string(worksheet, row, col,     expenses[row].item, NULL);
         worksheet_write_number(worksheet, row, col + 1, expenses[row].cost, NULL);
     }

     /* Write a total using a formula. */
     worksheet_write_string (worksheet, row, col,     "Total",       NULL);
     worksheet_write_formula(worksheet, row, col + 1, "=SUM(B1:B4)", NULL);

     /* Save the workbook and free any allocated memory. */
     return workbook_close(workbook);
}
```

## Things to install first (Prerequisite)

- Qt (5 or higher version) [https://www.qt.io](https://www.qt.io)

- zlib [https://zlib.net](https://zlib.net)

## How to setup (Installation)

- Add the following code in your Qt project file(*.pro).

```pro
# YourQtProject.pro

# Set environment values for Qlibxlsxwriter. 
# You may use default values.
QLIBXLSXWRITER_PARENTPATH = ../libxlsxwriter/
include(../Qlibxlsxwriter/Qlibxlsxwriter.pri)
```

- For more information, please see: [Setting for Qlibxlsxwriter](Setting.md)

## Tested Environment

| Travis CI |
| :-------: |
| [![Build Status](https://travis-ci.com/QtExcel/Qlibxlsxwriter.svg?branch=master)](https://travis-ci.com/QtExcel/Qlibxlsxwriter) |

- See [tested environments](TestEnv.md)

## License and links
- Qlibxlsxwriter is under MIT license. [https://github.com/QtExcel/Qxlnt](https://github.com/QtExcel/Qxlnt)
- libxlsxwriter is under FreeBSD license. [https://github.com/jmcnamara/libxlsxwriter](https://github.com/jmcnamara/libxlsxwriter)
   - [A message](https://github.com/QtExcel/Qlibxlsxwriter/issues/6) from [John McNamara @jmcnamara](https://github.com/jmcnamara)
- zlib is under zlib license. [https://zlib.net/](https://zlib.net/) [https://zlib.net/zlib_license.html](https://zlib.net/zlib_license.html)

## :mailbox: Contact
- Please leave an issue to me. [https://github.com/QtExcel/Qlibxlsxwriter/issues](https://github.com/QtExcel/Qlibxlsxwriter/issues)
- Hi! I'm j2doll (aka Jay Two). My native language is not English and my English is not fluent. Please, use EASY English. :-)

## Similar projects

### :star: <b>QXlsx</b> [https://github.com/QtExcel/QXlsx](https://github.com/QtExcel/QXlsx)

<p align="center"><img src="https://github.com/QtExcel/QXlsx/raw/master/markdown.data/QXlsx-Desktop.png"></p>

- QXlsx is excel file(*.xlsx) reader/writer library.
- Because QtXlsx is no longer supported(2014), I created a new project that is based on QtXlsx. (2017-)
- Development language of QXlsx is C++. (with Qt)
- You don't need to use static library or dynamic shared object using QXlsx. :+1:

### :star: <b>Qxlnt</b> [https://github.com/QtExcel/Qxlnt](https://github.com/QtExcel/Qxlnt)

<p align="center"><img src="https://github.com/QtExcel/Qxlnt/raw/master/markdown-data/Concept-QXlnt.jpg"></p>

- Qxlnt is a helper project that allows xlnt to be used in Qt.
- xlnt is a excellent library for using xlsx Excel files. :+1:
- I was looking for a way to make it easy to use in Qt. Of course, cmake is compatible with Qt, but it is not convenient to use. So I created Qxlnt.

### :star: <b>QSimpleXlsxWriter</b> [https://github.com/QtExcel/QSimpleXlsxWriter](https://github.com/QtExcel/QSimpleXlsxWriter)

- Use SimpleXlsxWriter in Qt.
- SimpleXlsxWriter is C++ library for creating XLSX files for MS Excel 2007 and above.

