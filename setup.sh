# principal packages:
sudo apt install awesome xinit rofi kitty ranger -y

# config startx for awesomewm:
sudo cp /etc/X11/xinit/xinitrc ~/.xinitrc
sudo echo -e "\n# setup for awesomewm
if [ -z "$DISPLAY" ] && [ "$XDG_VTNR" = 1 ]; then
    exec startx
fi\n" >> ~/.profile

# awesome config:
sudo mkdir -p ~/.config/awesome/
cp rc.lua ~/.config/awesome/

# rofi conf:
# sudo mkdir -p ~/.config/rofi
# rofi -dump-config > ~/.config/rofi/config.rasi

# kitty config:
mkdir -p ~/.config/kitty/
wget https://raw.githubusercontent.com/kovidgoyal/kitty-themes/master/themes/GitHub_Dark.conf
mv GitHub_Dark.conf ~/.config/kitty/kitty.conf
# rm GitHub_Dark.conf