# Qlibxlsxwriter

> *Read this in other languages: [English](README.md), :kr: [한국어](README.ko.md)*

<p align="center"><img src="https://github.com/QtExcel/Qlibxlsxwriter/raw/master/markdown.data/logo.png"></p>

- Qlibxlsxwriter는 libxlsxwriter를 Qt에서 사용할 수있는 도우미 프로젝트입니다.
- libxlsxwriter는 Excel XLSX 파일을 만들기 위한 C 라이브러리 입니다. :+1:
    - Q> Libxlsxwriter가 기존 Excel 파일을 템플릿으로 사용할 수 있습니까?
    - A> 아닙니다. Libxlsxwriter는 파일 작성용으로만 설계되었습니다. 기존 Excel 파일을 읽거나 수정할 수 없습니다. See [FAQ](http://libxlsxwriter.github.io/faq.html) for more information.


## 예제 (헬로우 월드!)

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

## 먼저 설치하여야 할 것들 (선행 사항)

- Qt (5 or higher version) [https://www.qt.io](https://www.qt.io)

- zlib [https://zlib.net](https://zlib.net)

## 설정하는 방법 (설치)

- 다음 코드를 여러분의 Qt 프로젝트 파일(*.pro)에 추가하세요.

```pro
# YourQtProject.pro

# Qlibxlsxwriter의 값을 설정하십시오.
# 기본값을 사용하셔도 됩니다.
QLIBXLSXWRITER_PARENTPATH = ../libxlsxwriter/
include(../Qlibxlsxwriter/Qlibxlsxwriter.pri)
```

- 자세한 정보는 다음을 참조하세요: [Setting for Qlibxlsxwriter](Setting.md)

## 테스트 환경

| Travis CI |
| :-------: |
| [![Build Status](https://travis-ci.com/QtExcel/Qlibxlsxwriter.svg?branch=master)](https://travis-ci.com/QtExcel/Qlibxlsxwriter) |

- [테스트 환경](TestEnv.md) 참조

## 라이센스와 링크
- Qlibxlsxwriter는  MIT license 입니다. [https://github.com/QtExcel/Qxlnt](https://github.com/QtExcel/Qxlnt)
- libxlsxwriter는 FreeBSD license 입니다. [https://github.com/jmcnamara/libxlsxwriter](https://github.com/jmcnamara/libxlsxwriter)
   - [John McNamara @jmcnamara](https://github.com/jmcnamara)로부터의 [메시지](https://github.com/QtExcel/Qlibxlsxwriter/issues/6)
- zlib는 zlib license 입니다. [https://zlib.net/](https://zlib.net/) [https://zlib.net/zlib_license.html](https://zlib.net/zlib_license.html)

## :mailbox: 문의
- 이슈를 남겨주세요. [https://github.com/QtExcel/Qlibxlsxwriter/issues](https://github.com/QtExcel/Qlibxlsxwriter/issues)

## 비슷한 프로젝트 

### :star: <b>QXlsx</b> [https://github.com/QtExcel/QXlsx](https://github.com/QtExcel/QXlsx)

<p align="center"><img src="https://github.com/QtExcel/QXlsx/raw/master/markdown.data/QXlsx-Desktop.png"></p>

- QXlsx는 엑셀 파일(*.xlsx)을 읽고 쓰는 라이브러리입니다.
- QtXlsx가 더이상 지원되지 않기 때문에(2014), QtXlsx에 기반한 새로운 프로젝트를 만들었습니다. (2017-)
- QXlsx는 개발언어로 C++를 사용합니다. (Qt 사용)
- QXlsx는 정적 또는 동적 라이브러리를 사용하지 않아도 되도록 제작되었습니다. :+1:

### :star: <b>Qxlnt</b> [https://github.com/QtExcel/Qxlnt](https://github.com/QtExcel/Qxlnt)

<p align="center"><img src="https://github.com/QtExcel/Qxlnt/raw/master/markdown-data/Concept-QXlnt.jpg"></p>

- Qxlnt는 xlnt가 Qt에서 사용될 수있게 해주는 도우미 프로젝트입니다.
- xlnt는 xlsx Excel 파일을 사용하기에 훌륭한 라이브러리입니다. :+1:
- xlnt를 Qt에서 사용하기 쉬운 방법을 찾고 있었습니다. 물론 cmake는 Qt와 호환되지만 사용하기가 쉽지 않습니다. 그래서 Qxlnt를 만들었습니다.

### :star: <b>QSimpleXlsxWriter</b> [https://github.com/QtExcel/QSimpleXlsxWriter](https://github.com/QtExcel/QSimpleXlsxWriter)

- Use SimpleXlsxWriter in Qt.
- SimpleXlsxWriter is C++ library for creating XLSX files for MS Excel 2007 and above.
