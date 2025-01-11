       IDENTIFICATION DIVISION.
       PROGRAM-ID. ListTables.

       ENVIRONMENT DIVISION.
       CONFIGURATION SECTION.
       INPUT-OUTPUT SECTION.

       DATA DIVISION.
       WORKING-STORAGE SECTION.

       * Database connection details
       01  DB-DSN             PIC X(50) VALUE 'MariaDB-ODBC'.
       01  DB-USER            PIC X(50) VALUE 'your_username'.
       01  DB-PASSWORD        PIC X(50) VALUE 'your_password'.
       01  DB-QUERY           PIC X(100) VALUE 'SHOW TABLES;'.

       * Host variable for table name
       01  TABLE-NAME         PIC X(100).

       PROCEDURE DIVISION.
       MAIN-SECTION.
           DISPLAY "Connecting to MariaDB...".

           EXEC SQL
               CONNECT TO :DB-DSN USER :DB-USER USING :DB-PASSWORD
           END-EXEC.

           IF SQLCODE NOT = 0
               DISPLAY "Connection failed. SQLCODE: " SQLCODE
               STOP RUN
           END-IF.

           DISPLAY "Connection successful.".
           DISPLAY "Listing all tables:".

           EXEC SQL
               DECLARE CURSOR1 CURSOR FOR
               SELECT table_name
               FROM information_schema.tables
               WHERE table_schema = DATABASE()
           END-EXEC.

           EXEC SQL
               OPEN CURSOR1
       IDENTIFICATION DIVISION.
       PROGRAM-ID. ListTables.

       ENVIRONMENT DIVISION.
       CONFIGURATION SECTION.
       INPUT-OUTPUT SECTION.

       DATA DIVISION.
       WORKING-STORAGE SECTION.

       * Database connection details
       01  DB-DSN             PIC X(50) VALUE 'MariaDB-ODBC'.
       01  DB-USER            PIC X(50) VALUE 'your_username'.
       01  DB-PASSWORD        PIC X(50) VALUE 'your_password'.
       01  DB-QUERY           PIC X(100) VALUE 'SHOW TABLES;'.

       * Host variable for table name
       01  TABLE-NAME         PIC X(100).

       PROCEDURE DIVISION.
       MAIN-SECTION.
           DISPLAY "Connecting to MariaDB...".

           EXEC SQL
               CONNECT TO :DB-DSN USER :DB-USER USING :DB-PASSWORD
           END-EXEC.

           IF SQLCODE NOT = 0
               DISPLAY "Connection failed. SQLCODE: " SQLCODE
               STOP RUN
           END-IF.

           DISPLAY "Connection successful.".
           DISPLAY "Listing all tables:".

           EXEC SQL
               DECLARE CURSOR1 CURSOR FOR
               SELECT table_name
               FROM information_schema.tables
               WHERE table_schema = DATABASE()
           END-EXEC.

           EXEC SQL
               OPEN CURSOR1
           END-EXEC.

           PERFORM UNTIL SQLCODE NOT = 0
               EXEC SQL
                   FETCH CURSOR1 INTO :TABLE-NAME
               END-EXEC

               IF SQLCODE = 0
                   DISPLAY TABLE-NAME
               END-IF
           END-PERFORM.

           EXEC SQL
               CLOSE CURSOR1
           END-EXEC.

           EXEC SQL
               DISCONNECT
           END-EXEC.

           DISPLAY "Done.".
           STOP RUN.


           END-EXEC.

           PERFORM UNTIL SQLCODE NOT = 0
               EXEC SQL
                   FETCH CURSOR1 INTO :TABLE-NAME
               END-EXEC

               IF SQLCODE = 0
                   DISPLAY TABLE-NAME
               END-IF
           END-PERFORM.

           EXEC SQL
               CLOSE CURSOR1
           END-EXEC.

           EXEC SQL
               DISCONNECT
           END-EXEC.

           DISPLAY "Done.".
           STOP RUN.
