package flashcard;

import flashcard.util.TarotManager;
import javafx.application.Application;
import javafx.fxml.FXMLLoader;
import javafx.scene.Parent;
import javafx.scene.Scene;
import javafx.stage.Stage;

import java.io.File;

public class Main extends Application {

    private static Stage primaryStage; // The main window of the application

    @Override
    public void start(Stage stage) throws Exception {
        primaryStage = stage;
        primaryStage.setTitle("FlashCard - Vocabulary Study App");
        primaryStage.setMinWidth(850);
        primaryStage.setMinHeight(560);
        primaryStage.setResizable(true);

        // Check if the Tarot screen should be displayed upon app launch.
        // If the user has selected "Don't show today", bypass it and go straight to the
        // main screen.
        if (TarotManager.shouldShowToday()) {
            switchScene("tarot");
        } else {
            switchScene("main");
        }
        primaryStage.show();
    }

    /**
     * Switches to a different screen by loading its corresponding FXML file.
     * 
     * @param sceneName Name of the screen without file extension, e.g., "main",
     *                  "study", "quiz", "deck_edit"
     */
    public static void switchScene(String sceneName) {
        try {
            File fxmlFile = new File("fxml" + File.separator + sceneName + ".fxml");
            FXMLLoader loader = new FXMLLoader(fxmlFile.toURI().toURL());
            Parent root = loader.load();
            Scene scene = new Scene(root);

            // Apply stylesheets if the file exists
            File cssFile = new File("style.css");
            if (cssFile.exists()) {
                scene.getStylesheets().add(cssFile.toURI().toURL().toExternalForm());
            }
            primaryStage.setScene(scene);
        } catch (Exception e) {
            e.printStackTrace();
            System.err.println("Failed to load scene: " + sceneName);
        }
    }

    public static Stage getPrimaryStage() {
        return primaryStage;
    }

    public static void main(String[] args) {
        launch(args); // Launch the JavaFX application
    }
}