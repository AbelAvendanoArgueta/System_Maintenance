#!/bin/bash

# Function to clean up packages
function clean_packages() {
  sudo apt-get -y autoclean && sudo apt-get -y autoremove
}

# Function to perform a full system update
function full_update() {
  sudo apt-get -y update && sudo apt-get -y full-upgrade
}

# Function to update all packages
function update_all() {
  sudo apt-get -y update && sudo apt-get -y upgrade
}

# Function to clean up packages and perform a full system update
function clean_full_update() {
  full_update
  clean_packages
}

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
      break
      ;;
    *) echo "Opción inválida";;
  esac
done