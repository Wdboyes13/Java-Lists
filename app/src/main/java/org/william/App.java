package org.william;

import java.util.*;
import java.io.*;
import javafx.application.*;
import javafx.scene.*;
import javafx.stage.*;
import javafx.scene.control.*;
import com.google.gson.*;
import com.google.gson.reflect.*;
import java.lang.reflect.*;

public class App extends Application {
    private static String[] tasksa;

    public static void main(String[] args) {
        launch(args);
    }

    @Override
    public void start(Stage primStage) {
        Platform.runLater(() -> {

            String json; // Declare it OUTSIDE first

            try (InputStream inputStream = App.class.getClassLoader().getResourceAsStream("list.json")) {
                if (inputStream == null) {
                    System.out.println("Resource not found");
                    return;
                }

                // Read the input stream and convert it to a String
                BufferedReader reader = new BufferedReader(new InputStreamReader(inputStream));
                StringWriter content = new StringWriter();
                String line;
                while ((line = reader.readLine()) != null) {
                    content.write(line);
                    content.write(System.lineSeparator()); // Add newline
                }

                // Save it
                json = content.toString();

            } catch (IOException e) {
                e.printStackTrace();
                return; // You should probably return if there's an error too
            }

            Gson gson = new Gson();
            Type type = new TypeToken<Map<String, String[]>>() {
            }.getType();
            Map<String, String[]> lists = gson.fromJson(json, type);

            // Now you can loop or grab any list dynamically!
            for (String key : lists.keySet()) {
                System.out.println("List name: " + key);
                String[] items = lists.get(key);

                // GSON gives Object[] because of Java type erasure, need to cast
                for (Object item : items) {
                    System.out.println("  - " + item);
                }
                System.out.println();
            }

            List<String> tasks = new ArrayList<>();
            Scanner inp = new Scanner(System.in);
            int tnum = 1;
            System.out.print("Do you want to create a temp list, y/n? ");
            String tr = inp.nextLine();
            if (tr.equals("y")) {
                while (true) {
                    System.out.print("Enter Task " + tnum + ": ");
                    tasks.add(inp.nextLine());
                    tnum += 1;

                    System.out.print("Do you want to add another? y/n: ");
                    String cont = inp.nextLine();

                    if (!cont.equals("y")) { // Break the loop if the user types anything other than "y"
                        break;
                    }
                }
                tasksa = tasks.toArray(new String[0]);
            } else {
                System.out.print("Enter ListID from list.json: ");
                String lid = inp.nextLine();
                tasksa = lists.get(lid);
                tasksa = lists.get(lid);
                if (tasksa == null) {
                    System.out.println("List not found! Exiting...");
                    Platform.exit();
                    inp.close();
                    return;
                }
            }

            // Convert the list to an array
            inp.close();

            makeGUI(primStage);
        });
    }

    private void makeGUI(Stage primStage) {
        Group root = new Group();
        int stx = 20;
        int sty = 20;
        int xsec = 0;
        for (int i = 0; i < tasksa.length; i++) {
            if (xsec == 10) {
                stx += 100;
                sty = 20;
                xsec = 0;
            }
            CheckBox text = new CheckBox(tasksa[i]);
            text.setTranslateX(stx);
            text.setTranslateY(sty);
            sty += 30;
            root.getChildren().add(text);
            xsec += 1;
        }
        Scene scene = new Scene(root, 500, 350);
        primStage.setScene(scene);
        primStage.show();
    }

}
