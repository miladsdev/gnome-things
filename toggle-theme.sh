!#/bin/bash

theme="$(gsettings get org.gnome.desktop.interface color-scheme)"

if [[ $theme =~ "prefer-dark" ]]; 
then 
    gsettings set org.gnome.desktop.interface gtk-theme "adw-gtk3" && gsettings set org.gnome.desktop.interface color-scheme "default"
    sed -i "s/\"workbench\.colorTheme\": \"Adwaita Dark & default syntax highlighting\",/\"workbench.colorTheme\": \"Adwaita Light \& default syntax highlighting\",/" "$HOME/.config/Code/User/settings.json"
    sed -i 's/<global_color_scheme name="Dark" \/>/<global_color_scheme name="Light" \/>/' /home/milad/.config/JetBrains/PhpStorm*/options/colors.scheme.xml
    sed -i 's/<laf class-name="com.intellij.ide.ui.laf.IntelliJLaf" themeId="ExperimentalDark" \/>/<laf class-name="com.intellij.ide.ui.laf.IntelliJLaf" themeId="ExperimentalLight" \/>/' /home/milad/.config/JetBrains/PhpStorm*/options/laf.xml

else 
    gsettings set org.gnome.desktop.interface gtk-theme "adw-gtk3-dark" && gsettings set org.gnome.desktop.interface color-scheme "prefer-dark"
    sed -i "s/\"workbench\.colorTheme\": \"Adwaita Light & default syntax highlighting\",/\"workbench.colorTheme\": \"Adwaita Dark \& default syntax highlighting\",/" "$HOME/.config/Code/User/settings.json"
    sed -i 's/<global_color_scheme name="Light" \/>/<global_color_scheme name="Dark" \/>/' /home/milad/.config/JetBrains/PhpStorm*/options/colors.scheme.xml
    sed -i 's/<laf class-name="com.intellij.ide.ui.laf.IntelliJLaf" themeId="ExperimentalLight" \/>/<laf class-name="com.intellij.ide.ui.laf.IntelliJLaf" themeId="ExperimentalDark" \/>/' /home/milad/.config/JetBrains/PhpStorm*/options/laf.xml

fi
