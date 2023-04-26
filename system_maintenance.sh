#!/bin/bash

# Detect the system distribution
if [ -f /etc/os-release ]; then
    . /etc/os-release
    OS=$NAME
elif type lsb_release >/dev/null 2>&1; then
    OS=$(lsb_release -si)
else
    OS=$(uname -s)
fi

# Function to clean up packages
function clean_packages() {
    if [[ $OS == *"Debian"* ]] || [[ $OS == *"Ubuntu"* ]]; then
        sudo apt-get -y autoclean && sudo apt-get -y autoremove
    elif [[ $OS == *"Fedora"* ]] || [[ $OS == *"Red Hat"* ]]; then
        sudo dnf -y clean all && sudo dnf -y autoremove
    elif [[ $OS == *"openSUSE"* ]]; then
        sudo zypper clean -a && sudo zypper --non-interactive rm -u
    elif [[ $OS == *"Arch"* ]]; then
        sudo pacman -Scc && sudo pacman -Rns $(pacman -Qtdq)
    fi
}

# Function to perform a full system update
function full_update() {
    if [[ $OS == *"Debian"* ]] || [[ $OS == *"Ubuntu"* ]]; then
        sudo apt-get -y update && sudo apt-get -y full-upgrade
    elif [[ $OS == *"Fedora"* ]] || [[ $OS == *"Red Hat"* ]]; then
        sudo dnf -y upgrade
    elif [[ $OS == *"openSUSE"* ]]; then
        sudo zypper --non-interactive update
    elif [[ $OS == *"Arch"* ]]; then
        sudo pacman -Syu
    fi
}

# Function to update all packages
function update_all() {
    if [[ $OS == *"Debian"* ]] || [[ $OS == *"Ubuntu"* ]]; then
        sudo apt-get -y update && sudo apt-get -y upgrade
    elif [[ $OS == *"Fedora"* ]] || [[ $OS == *"Red Hat"* ]]; then
        sudo dnf -y upgrade
    elif [[ $OS == *"openSUSE"* ]]; then
        sudo zypper --non-interactive update
    elif [[ $OS == *"Arch"* ]]; then
        sudo pacman -Syu
    fi
}

# Function to clean up packages and perform a full system update
function clean_full_update() {
  full_update
  clean_packages
}

while true
do
  figlet -f 3d.flf -w 120 "System" | lolcat
  figlet -f 3d.flf -w 120 "Maintenance" | lolcat

  # Set up the options menu
  PS3="Seleccione la acción que desea realizar: "
  options=("Limpiar paquetes" "Actualización completa" "Actualizar todos los paquetes" "Limpiar y actualizar" "Salir")

  # Display the options menu and execute the corresponding function based on the user's choice
  select opt in "${options[@]}"
  do
    case $opt in
      "Limpiar paquetes")
        clean_packages
        ;;
      "Actualización completa")
        full_update
        ;;
      "Actualizar todos los paquetes")
        update_all
        ;;
      "Limpiar y actualizar")
        clean_full_update
        ;;
      "Salir")
        exit 0
        ;;
      *) echo "Opción inválida";;
    esac

    # Reset PS3 variable
    PS3="Seleccione la acción que desea realizar: "
    break
  done
done