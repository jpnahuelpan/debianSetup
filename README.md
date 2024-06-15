# Debian Setup.

After you log in, add sudo command and you user in sudoers file:
```bash
$ su
<password>: <Enter you root password>
$ apt install sudo
$ sudo visudo
<Edit file:>
<Add this lane> >> '<user> = ALL(ALL:ALL): ALL'
$ exit
```

Update de system:
```bash
$ sudo apt update
```

Now install git:
```bash
$ sudo apt install git
```

For install setup:
```bash
$ git clone https://github.com/jpnahuelpan/debianSetup.git
$ cd debianSetup
$ bash setup.sh
$ cd ..
$ rm -rf debianSetup
```

For finish
```bash
$ sudo reboot
```
