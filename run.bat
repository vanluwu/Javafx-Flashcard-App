@echo off
REM ============================================================
REM  FlashCard - Run script (Windows)
REM  Modify JAVAFX_PATH to match the configuration in compile.bat
REM ============================================================

set JAVAFX_PATH=C:\javafx-sdk\lib

java --module-path "%JAVAFX_PATH%" ^
     --add-modules javafx.controls,javafx.fxml ^
     -cp out ^
     flashcard.Main
pause
