// main.cpp

#include <QtGlobal>
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
