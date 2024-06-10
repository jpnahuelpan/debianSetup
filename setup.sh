# principal packages:
sudo apt install awesome xinit rofi nautilus -y

# config startx for awesomewm:
cp /etc/X11/xinit/xinitrc ~/.xinitrc
echo -e '\n# setup for awesomewm
if [ -z "$DISPLAY" ] && [ "$XDG_VTNR" = 1 ]; then
    exec startx
fi\n' >> ~/.profile

# awesome config:
mkdir -p ~/.config/awesome/
cp rc.lua ~/.config/awesome/


# kitty install:
curl -L https://sw.kovidgoyal.net/kitty/installer.sh | sh /dev/stdin
echo -e '\n# kitty bin
export PATH="$PATH:$HOME/.local/kitty.app/bin\n' >> ~/.profile
cp ~/.local/kitty.app/share/applications/kitty.desktop ~/.local/share/applications/
cp ~/.local/kitty.app/share/applications/kitty-open.desktop ~/.local/share/applications/
sed -i "s|Icon=kitty|Icon=/home/$USER/.local/kitty.app/share/icons/hicolor/256x256/apps/kitty.png|g" ~/.local/share/applications/kitty*.desktop
sed -i "s|Exec=kitty|Exec=/home/$USER/.local/kitty.app/bin/kitty|g" ~/.local/share/applications/kitty*.desktop
echo 'kitty.desktop' > ~/.config/xdg-terminals.list