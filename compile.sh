#!/bin/bash
# ============================================================
#  FlashCard - Compile script (macOS / Linux)
#  Set JAVAFX_PATH to the lib folder of your JavaFX SDK
#  Example: JAVAFX_PATH=/Users/vanluu/Downloads/javafx-sdk-17.0.19/lib
# ============================================================

JAVAFX_PATH=/Users/vanluu/Downloads/javafx-sdk-17.0.19/lib

echo "Compiling..."
mkdir -p out

find flashcard -name "*.java" > sources.txt

javac --module-path "$JAVAFX_PATH" \
      --add-modules javafx.controls,javafx.fxml \
      -encoding UTF-8 \
      -d out \
      @sources.txt

if [ $? -eq 0 ]; then
    echo ""
    echo "Compiled successfully! Run ./run.sh to start the app."
else
    echo ""
    echo "Compilation failed. Check your JavaFX SDK path."
fi

rm sources.txt
