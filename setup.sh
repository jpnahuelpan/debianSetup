# Create folders
mkdir ~/Desktop ~/Documents ~/Downloads ~/Music ~/Pictures ~/Videos ~/PROJECTS

# principal packages:
sudo apt install curl awesome xinit rofi -y
sudo apt install --no-install-recommends eog thunar okular -y

# update PATH for use sbin (system binaries):
echo -e '\n#System binaries 
export PATH="$PATH:/sbin:/usr/sbin"\n' >> ~/.profile

# install helix 24.03:
curl -L -O https://github.com/helix-editor/helix/releases/download/24.03/helix-24.03-x86_64-linux.tar.xz
mkdir -p ~/.local/helix-24.03/bin ~/.config/helix
tar -xJvf helix*.tar.xz
cp helix-24.03-x86_64-linux/* ~/.local/helix-24.03/bin/
cp helix/config.toml ~/.config/helix/config.toml
echo -e '\n# helix bin
export PATH="$PATH:$HOME/.local/helix-24.03/bin"' >> ~/.profile

# kitty install:
curl -L https://sw.kovidgoyal.net/kitty/installer.sh | sh /dev/stdin
echo -e '\n# kitty bin
export PATH="$PATH:$HOME/.local/kitty.app/bin"\n' >> ~/.profile
mkdir -p ~/.local/share/applications/
cp ~/.local/kitty.app/share/applications/kitty.desktop ~/.local/share/applications/
cp ~/.local/kitty.app/share/applications/kitty-open.desktop ~/.local/share/applications/
sed -i "s|Icon=kitty|Icon=/home/$USER/.local/kitty.app/share/icons/hicolor/256x256/apps/kitty.png|g" ~/.local/share/applications/kitty*.desktop
sed -i "s|Exec=kitty|Exec=/home/$USER/.local/kitty.app/bin/kitty|g" ~/.local/share/applications/kitty*.desktop
echo 'kitty.desktop' >> ~/.config/xdg-terminals.list

# install zellij
curl -L -O https://github.com/zellij-org/zellij/releases/download/v0.40.1/zellij-x86_64-unknown-linux-musl.tar.gz
tar -xvf zellij*.tar.gz
#chmod +x zellij
sudo cp zellij /usr/local/bin/zellij

# install chrome
curl -L -O https://dl.google.com/linux/direct/google-chrome-stable_current_amd64.deb
sudo apt install ./google-chrome-stable_current_amd64.deb

# dark theme gtk-3.0
mkdir -p ~/.config/gtk-3.0
echo -e '[Settings]
gtk-icon-theme-name = Adwaita
gtk-theme-name = Adwaita
gtk-application-prefer-dark-theme = true' >> ~/.config/gtk-3.0/settings.ini

# breeze dark theme for okular
curl -L -O https://raw.githubusercontent.com/KDE/breeze/master/colors/BreezeDark.colors
cp BreezeDark.colors ~/.config/okularrc

# config startx for awesomewm:
cp /etc/X11/xinit/xinitrc ~/.xinitrc
echo -e '\n# setup for awesomewm
if [ -z "$DISPLAY" ] && [ "$XDG_VTNR" = 1 ]; then
    exec startx
fi\n' >> ~/.profile

# awesome config:
mkdir -p ~/.config/awesome/
cp rc.lua ~/.config/awesome/
