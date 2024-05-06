# principal packages:
apt install awesome xinit rofi kitty ranger -y

# config startx for awesomewm:
cp /etc/X11/xinit/xinitrc ~/.xinitrc
echo -e "\n# setup for awesomewm
if [ -z "$DISPLAY" ] && [ "$XDG_VTNR" == 1]; then
    exec startx
fi\n" >> .profile.sh

# awesome config:
makdir -p ~/.config/awesome
cp rc.lua ~/.config/awesome/rc.lua

# rofi conf:
mkdir -p ~/.config/rofi
rofi -dump-config > ~/.config/rofi/config.rasi