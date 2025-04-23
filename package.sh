# copy Linux JFX
cp ~/coding/morning/app/build/javafx-libs/javafx-base-21-linux.jar ~/coding/morning/pkg/lib/linux/
cp ~/coding/morning/app/build/javafx-libs/javafx-graphics-21-linux.jar ~/coding/morning/pkg/lib/linux/
cp ~/coding/morning/app/build/javafx-libs/javafx-fxml-21-linux.jar ~/coding/morning/pkg/lib/linux/
cp ~/coding/morning/app/build/javafx-libs/javafx-controls-21-linux.jar ~/coding/morning/pkg/lib/linux/

# copy mac JFX
cp ~/coding/morning/app/build/javafx-libs/javafx-base-21-mac.jar ~/coding/morning/pkg/lib/mac/
cp ~/coding/morning/app/build/javafx-libs/javafx-graphics-21-mac.jar ~/coding/morning/pkg/lib/mac/
cp ~/coding/morning/app/build/javafx-libs/javafx-fxml-21-mac.jar ~/coding/morning/pkg/lib/mac/
cp ~/coding/morning/app/build/javafx-libs/javafx-controls-21-mac.jar ~/coding/morning/pkg/lib/mac/

# copy mac-aarch64 JFX
cp ~/coding/morning/app/build/javafx-libs/javafx-base-21-mac-aarch64.jar ~/coding/morning/pkg/lib/mac-aarch/
cp ~/coding/morning/app/build/javafx-libs/javafx-graphics-21-mac-aarch64.jar ~/coding/morning/pkg/lib/mac-aarch/
cp ~/coding/morning/app/build/javafx-libs/javafx-fxml-21-mac-aarch64.jar ~/coding/morning/pkg/lib/mac-aarch/
cp ~/coding/morning/app/build/javafx-libs/javafx-controls-21-mac-aarch64.jar ~/coding/morning/pkg/lib/mac-aarch/

# copy win JFX
cp ~/coding/morning/app/build/javafx-libs/javafx-base-21-win.jar ~/coding/morning/pkg/lib/win/
cp ~/coding/morning/app/build/javafx-libs/javafx-graphics-21-win.jar ~/coding/morning/pkg/lib/win/
cp ~/coding/morning/app/build/javafx-libs/javafx-fxml-21-win.jar ~/coding/morning/pkg/lib/win/
cp ~/coding/morning/app/build/javafx-libs/javafx-controls-21-win.jar ~/coding/morning/pkg/lib/win/

cp ~/coding/morning/app/build/libs/app-all.jar ~/coding/morning/pkg/app-all.jar
chmod +x ~/coding/morning/pkg/run.sh
tar czf task.tar.gz ~/coding/morning/pkg