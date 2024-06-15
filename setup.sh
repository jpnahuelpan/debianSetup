# principal packages:
sudo apt install awesome xinit rofi helix sxiv evince evince-common -y

# update PATH for use sbin (system binaries):
echo -e '\n#System binaries 
export PATH="$PATH:/sbin:/usr/sbin"\n' >> ~/.profile

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
export PATH="$PATH:$HOME/.local/kitty.app/bin"\n' >> ~/.profile
mkdir -p ~/.local/share/applications/
cp ~/.local/kitty.app/share/applications/kitty.desktop ~/.local/share/applications/
cp ~/.local/kitty.app/share/applications/kitty-open.desktop ~/.local/share/applications/
sed -i "s|Icon=kitty|Icon=/home/$USER/.local/kitty.app/share/icons/hicolor/256x256/apps/kitty.png|g" ~/.local/share/applications/kitty*.desktop
sed -i "s|Exec=kitty|Exec=/home/$USER/.local/kitty.app/bin/kitty|g" ~/.local/share/applications/kitty*.desktop
echo 'kitty.desktop' > ~/.config/xdg-terminals.list

# install firefox
install -d -m 0755 /etc/apt/keyrings
wget -q https://packages.mozilla.org/apt/repo-signing-key.gpg -O- | sudo tee /etc/apt/keyrings/packages.mozilla.org.asc > /dev/null
gpg -n -q --import --import-options import-show /etc/apt/keyrings/packages.mozilla.org.asc | awk '/pub/{getline; gsub(/^ +| +$/,""); print "\n"$0"\n"}'
echo "---------------- this is the key: 35BAA0B33E9EB396F59CA838C0BA5CE6DC6315A3 -----------------"
echo "deb [signed-by=/etc/apt/keyrings/packages.mozilla.org.asc] https://packages.mozilla.org/apt mozilla main" | sudo tee -a /etc/apt/sources.list.d/mozilla.list > /dev/null
echo '
Package: *
Pin: origin packages.mozilla.org
Pin-Priority: 1000
' | sudo tee /etc/apt/preferences.d/mozilla
apt update && sudo apt install firefox
