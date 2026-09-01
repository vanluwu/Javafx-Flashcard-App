#!/bin/bash
# ============================================================
#  FlashCard - Run script (macOS / Linux)
# ============================================================

JAVAFX_PATH=/Users/vanluu/Downloads/javafx-sdk-17.0.19/lib

java --module-path "$JAVAFX_PATH" \
     --add-modules javafx.controls,javafx.fxml \
     -cp out \
     flashcard.Main
