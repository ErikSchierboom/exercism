      *Sample COBOL program
       IDENTIFICATION DIVISION.
       PROGRAM-ID. hello-world.
       DATA DIVISION.
       WORKING-STORAGE SECTION.
       01 WS-RESULT PIC X(14).
       PROCEDURE DIVISION.
       HELLO-WORLD.
        MOVE "Hello, World!" TO WS-RESULT.
            