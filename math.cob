       IDENTIFICATION DIVISION.
       PROGRAM-ID. PERSON.
       AUTHOR. BERTJAN.

       ENVIRONMENT DIVISION.

       DATA DIVISION.
       WORKING-STORAGE SECTION.
       01 WS-AFTER-VAT         PIC 9(5)V99.
       01 WS-PRICE-BEFORE-VAT  PIC 9(5)V99.
       01 WS-VAT-RATE          PIC 9(2)V99 VALUE 0.21.
       01 WS_VAT-INCREASE      PIC 9(5)V99.
       PROCEDURE DIVISION.

           DISPLAY "Enter the price before VAT: "
           DISPLAY "Decimal separator is a point, e.g. 100.00"
           ACCEPT WS-PRICE-BEFORE-VAT

           MULTIPLY WS-PRICE-BEFORE-VAT BY WS-VAT-RATE 
               GIVING WS_VAT-INCREASE
           ADD WS_VAT-INCREASE TO WS-PRICE-BEFORE-VAT 
               GIVING WS-AFTER-VAT


           DISPLAY "Price after VAT is: " WS-AFTER-VAT
           STOP RUN.
