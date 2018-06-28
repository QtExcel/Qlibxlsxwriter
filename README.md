# Qlibxlsxwriter

> *Read this in other languages: [English](README.md), :kr: [한국어](README.ko.md)*

- Qlibxlsxwriter is a helper project that allows libxlsxwriter to be used in Qt.
- libxlsxwriter is a C library for creating Excel XLSX files. 

## Hello World!
```cpp
// main.cpp
//
// Qlibxlsxwriter MIT license     https://github.com/j2doll/Qlibxlsxwriter
// libxlsxwriter  FreeBSD license https://github.com/jmcnamara/libxlsxwriter

#include <QCoreApplication>

#include "xlsxwriter.h"

int main(int argc, char **argv)
{
     QCoreApplication app(argc, argv); // it is a Qt code.

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

    return 0;
}
```
## Test Environment
- Qt 5.11.1 / MingW 5.3.0 32bit / gcc 5.3.0 / mingw32-make 4.1
- Qt 5.9.2 / CentOS(Linux) 3.10.0-693.17.1.el7.x86_64 x86_64 / gcc 4.8.5 / make 3.8.2

## License and links
- Qlibxlsxwriter is under MIT license.
	- [https://github.com/j2doll/Qxlnt](https://github.com/j2doll/Qxlnt)

- libxlsxwriter is under FreeBSD license.
	- [https://github.com/jmcnamara/libxlsxwriter](https://github.com/jmcnamara/libxlsxwriter)

- zlib is under zlibe license. 
	- [https://zlib.net/](https://zlib.net/) 
	- [https://zlib.net/zlib_license.html](https://zlib.net/zlib_license.html)

## :mailbox: Contact
- Please leave an issue to me. [https://github.com/j2doll/Qlibxlsxwriter/issues](https://github.com/j2doll/Qlibxlsxwriter/issues)
- Hi! I'm j2doll (aka Jay Two). My native language is not English and my English is not fluent. Please, use EASY English. :-)

## Similar projects going on
- :star: QXlsx [https://github.com/j2doll/QXlsx](https://github.com/j2doll/QXlsx)
	- QXlsx is excel file(*.xlsx) reader/writer library.
		- Because QtXlsx is no longer supported(2014), I created a new project that is based on QtXlsx. (2017-)
		- Development language of QXlsx is C++. (with Qt 5.x)
		- You don't need to use static library or dynamic shared object using QXlsx.

* :star: Qxlnt [https://github.com/j2doll/Qxlnt](https://github.com/j2doll/Qxlnt)
	- Qxlnt is a helper project that allows xlnt to be used in Qt.
	- xlnt is a excellent library for usinf xlsx Excel files.
	- I was looking for a way to make it easy to use in Qt. Of course, cmake is compatible with Qt, but it is not convenient to use. So I created Qxlnt.

