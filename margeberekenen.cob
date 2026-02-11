       IDENTIFICATION DIVISION.
       PROGRAM-ID. MARGE.
       author. bertjan.

       
       DATA DIVISION.
       WORKING-STORAGE SECTION.
       01 WS-INKOOPPRIJS              PIC 9(5)V99.
       01 WS-VERZOCHT-MARGE-PERC      PIC 9(3)V99.
       01 WS-FACTOR                   PIC 9V9999.
       01 WS-VERKOOPPRIJS             PIC 9(6)V99.
       01 WS-VERKOOPPRIJS-DISPLAY PIC ZZZ,ZZ9.99.
       PROCEDURE DIVISION.
           display "Geef comma getallen 129,43 in met. dus 129.43"
           DISPLAY "Voer inkoopprijs in: "
           ACCEPT WS-INKOOPPRIJS

           DISPLAY "Voer marge percentage in: "
           ACCEPT WS-VERZOCHT-MARGE-PERC 

           COMPUTE WS-FACTOR =
               (100 - WS-VERZOCHT-MARGE-PERC) / 100
           
           COMPUTE WS-VERKOOPPRIJS =
               WS-INKOOPPRIJS / WS-FACTOR
           
           MOVE WS-VERKOOPPRIJS TO WS-VERKOOPPRIJS-DISPLAY
           DISPLAY "Verkoopprijs: " WS-VERKOOPPRIJS-DISPLAY 
               
           STOP RUN.
