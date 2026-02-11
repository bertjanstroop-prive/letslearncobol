       >>SOURCE FORMAT IS FREE
       IDENTIFICATION DIVISION.
       PROGRAM-ID. ADVENTURE.
       AUTHOR. BERTJAN.

       DATA DIVISION.
       WORKING-STORAGE SECTION.
       01 WS-NAME            PIC X(30).
       01 WS-DRAGON-HEALTH   PIC 9(4) VALUE 1000.
       01 WS-WEAPON-CHOICE  PIC 9     VALUE 0.

       PROCEDURE DIVISION.

       MAIN.
           DISPLAY "What is your name, adventurer? "
           ACCEPT WS-NAME

           DISPLAY "Welcome " FUNCTION TRIM(WS-NAME) "."
           DISPLAY "The king has tasked you with defeating the dragon and saving the kingdom."
           DISPLAY "You set out on your adventure and after a long journey"
           DISPLAY "you finally reach the dragon's lair."

           CALL "C$SLEEP" USING 1
           DISPLAY "."
           CALL "C$SLEEP" USING 1
           DISPLAY ".."
           CALL "C$SLEEP" USING 1
           DISPLAY "..."
           CALL "C$SLEEP" USING 1

           DISPLAY "The dragon appears and breathes fire at you,"
           DISPLAY "but you are quick and dodge the attack!"

           PERFORM UNTIL WS-DRAGON-HEALTH <= 0
               PERFORM CHOOSE-WEAPON
               PERFORM ATTACK-DRAGON
           END-PERFORM

           DISPLAY "The dragon collapses. The kingdom is saved!"
           STOP RUN
       .

       CHOOSE-WEAPON.
           MOVE 0 TO WS-WEAPON-CHOICE
           PERFORM UNTIL WS-WEAPON-CHOICE >= 1 AND WS-WEAPON-CHOICE <= 3
               DISPLAY "You have three weapons to choose from:"
               DISPLAY "  1. Sword"
               DISPLAY "  2. Bow and Arrow"
               DISPLAY "  3. Magic Staff"
               DISPLAY "Which weapon do you choose? (1, 2, or 3)"
               ACCEPT WS-WEAPON-CHOICE
               IF WS-WEAPON-CHOICE < 1 OR WS-WEAPON-CHOICE > 3
                   DISPLAY "Invalid choice. Try again."
               END-IF
           END-PERFORM
       .

       ATTACK-DRAGON.
           EVALUATE WS-WEAPON-CHOICE
               WHEN 1
                   DISPLAY "You swing your sword at the dragon and deal 200 damage!"
                   SUBTRACT 200 FROM WS-DRAGON-HEALTH
               WHEN 2
                   DISPLAY "You shoot an arrow at the dragon and deal 150 damage!"
                   SUBTRACT 150 FROM WS-DRAGON-HEALTH
               WHEN 3
                   DISPLAY "You cast a spell at the dragon and deal 300 damage!"
                   SUBTRACT 300 FROM WS-DRAGON-HEALTH
               WHEN OTHER
                   DISPLAY "You hesitate... and do no damage."
           END-EVALUATE

           DISPLAY "The dragon's health is now " WS-DRAGON-HEALTH "."

           if WS-DRAGON-HEALTH <= 0
               DISPLAY "The dragon is defeated!"
               STOP RUN
           else
               DISPLAY "The dragon breathes fire at you again!"
           END-IF
       .
