# Qlibxlsxwriter

> *Read this in other languages: [English](README.md), :kr: [한국어](README.ko.md)*

- Qlibxlsxwriter는 libxlsxwriter를 Qt에서 사용할 수있는 도우미 프로젝트입니다.
- libxlsxwriter는 Excel XLSX 파일을 만들기위한 C 라이브러리 입니다.

## 헬로우 월드!

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
}
```

## 테스트 환경
- Qt 5.11.1 / MingW 5.3.0 32bit / gcc 5.3.0 / mingw32-make 4.1
- Qt 5.9.2 / CentOS(Linux) 3.10.0-693.17.1.el7.x86_64 x86_64 / gcc 4.8.5 / make 3.8.2 / zlib-devel

## 라이센스와 링크
- Qlibxlsxwriter is under MIT license. [https://github.com/j2doll/Qxlnt](https://github.com/j2doll/Qxlnt)
- libxlsxwriter is under FreeBSD license. [https://github.com/jmcnamara/libxlsxwriter](https://github.com/jmcnamara/libxlsxwriter)
- zlib is under zlib license. [https://zlib.net/](https://zlib.net/) [https://zlib.net/zlib_license.html](https://zlib.net/zlib_license.html)

## :mailbox: 문의
- 이슈를 남겨주세요. [https://github.com/j2doll/Qlibxlsxwriter/issues](https://github.com/j2doll/Qlibxlsxwriter/issues)

## 비슷한 프로젝트 
- :star: QXlsx [https://github.com/j2doll/QXlsx](https://github.com/j2doll/QXlsx)
    - QXlsx는 엑셀 파일(*.xlsx)을 읽고 쓰는 라이브러리입니다.
        - QtXlsx가 더이상 지원되지 않기 때문에(2014), QtXlsx에 기반한 새로운 프로젝트를 만들었습니다. (2017-)
        - QXlsx는 개발언어로 C++를 사용합니다. (Qt 5.x 사용)
        - QXlsx는 정적 또는 동적 라이브러리를 사용하지 않아도 되도록 제작되었습니다.

* :star: Qxlnt [https://github.com/j2doll/Qxlnt](https://github.com/j2doll/Qxlnt)
    - Qxlnt는 xlnt가 Qt에서 사용될 수있게 해주는 도우미 프로젝트입니다.
    - xlnt는 xlsx Excel 파일을 사용하기에 훌륭한 라이브러리입니다.
    - xlnt를 Qt에서 사용하기 쉬운 방법을 찾고 있었습니다. 물론 cmake는 Qt와 호환되지만 사용하기가 쉽지 않습니다. 그래서 Qxlnt를 만들었습니다.
