#! /bin/sh

my_title () {
echo ""
echo ""
echo ""
echo -e "\033[1;97;41m---$1---\033[0m"
echo ""
echo ""
}

my_title "SYS PACKAGES AND AUR UPGRADE"
yay -Syyyu

my_title "PACKAGES TO REBUILD"
yay -S --rebuild --answerclean A --answerdiff N $(checkrebuild | cut -f2 | grep -v "linux-lts")

my_title "REBUILD KERNEL IMAGES"

if [ $1 == "cpio" ]
then
    sudo mkinitcpio -P
fi

if [ $1 == "dracut" ]
then
    sudo dracut-rebuild
fi

my_title "UPDATE GRUB"
sudo update-grub

my_title "FLATPAK UPDATES"
flatpak update

my_title "UPDATE PLASMA WIDGETS"
sera -u

