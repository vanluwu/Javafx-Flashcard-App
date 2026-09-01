@echo off
REM ============================================================
REM  FlashCard - Compile script (Windows)
REM  Set JAVAFX_PATH to the lib folder of your JavaFX SDK
REM  Example: JAVAFX_PATH=/Users/vanluu/Downloads/javafx-sdk-17.0.19/lib
REM ============================================================

set JAVAFX_PATH=C:/Users/vanluu/Downloads

echo Compiling...

if not exist out mkdir out

dir /s /b flashcard\*.java > sources.txt

javac --module-path "%JAVAFX_PATH%" ^
      --add-modules javafx.controls,javafx.fxml ^
      -encoding UTF-8 ^
      -d out ^
      @sources.txt

if %ERRORLEVEL% == 0 (
    echo.
    echo Compiled successfully! Run ./run.sh to start the app.
) else (
    echo.
    echoCompilation failed. Check your JavaFX SDK path.
)

del sources.txt
pause
