       IDENTIFICATION DIVISION.
       PROGRAM-ID. PERSON.
       author. bertjan.

       
       DATA DIVISION.
       WORKING-STORAGE SECTION.
       01 WS-NAME     PIC X(30).
       01 WS-AGE      PIC 99.
       01 WS-LOCAL    PIC X(30).

       PROCEDURE DIVISION.

           DISPLAY "Enter your name: "
           ACCEPT WS-NAME

           DISPLAY "Enter your age: "
           ACCEPT WS-AGE

           DISPLAY "ENTER YOUR COUNTRY: "
           ACCEPT WS-LOCAL
           
           DISPLAY "Hello " FUNCTION TRIM(WS-NAME)
                   ", age " WS-AGE
                   ", from " FUNCTION TRIM(WS-LOCAL)
                   "."
               
           STOP RUN.
