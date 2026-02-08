       IDENTIFICATION DIVISION.
       PROGRAM-ID. READCSV.

       ENVIRONMENT DIVISION.
       INPUT-OUTPUT SECTION.
       FILE-CONTROL.
           SELECT CSV-FILE ASSIGN TO "people.csv"
               ORGANIZATION IS LINE SEQUENTIAL.

       DATA DIVISION.
       FILE SECTION.
       FD  CSV-FILE.
       01  CSV-LINE                 PIC X(1024).

       WORKING-STORAGE SECTION.
       01  EOF-FLAG                 PIC X VALUE "N".
           88 EOF                   VALUE "Y".
           88 NOT-EOF               VALUE "N".

       01  IS-FIRST-LINE            PIC X VALUE "Y".
           88 FIRST-LINE            VALUE "Y".
           88 NOT-FIRST-LINE        VALUE "N".

       01  F-ID                     PIC X(32).
       01  F-NAME                   PIC X(128).
       01  F-SCORE                  PIC X(32).

       PROCEDURE DIVISION.
           OPEN INPUT CSV-FILE

           PERFORM UNTIL EOF
               READ CSV-FILE
                   AT END
                       SET EOF TO TRUE
                   NOT AT END
                       IF FIRST-LINE
                           SET NOT-FIRST-LINE TO TRUE
                       ELSE
                           MOVE SPACES TO F-ID F-NAME F-SCORE
                           UNSTRING CSV-LINE
                               DELIMITED BY ","
                               INTO F-ID F-NAME F-SCORE
                           END-UNSTRING

                           DISPLAY "ID="   FUNCTION TRIM(F-ID)
                                   " NAME=" FUNCTION TRIM(F-NAME)
                                   " SCORE=" FUNCTION TRIM(F-SCORE)
                       END-IF
               END-READ
           END-PERFORM

           CLOSE CSV-FILE
           STOP RUN.
