#!/usr/bin/env python3

import os

# Función para limpieza de paquetes
def clean_packages():
    if os.path.exists("/usr/bin/apt-get"):
        os.system("sudo apt-get -y autoclean && sudo apt-get -y autoremove")
    elif os.path.exists("/usr/bin/dnf"):
        os.system("sudo dnf -y clean all && sudo dnf -y autoremove")
    elif os.path.exists("/usr/bin/zypper"):
        os.system("sudo zypper clean -a && sudo zypper --non-interactive rm -u")
    elif os.path.exists("/usr/bin/pacman"):
        os.system("sudo pacman -Scc && sudo pacman -Rns $(pacman -Qtdq)")

#  Función actualización completa de paquetes
def full_update():
    if os.path.exists("/usr/bin/apt-get"):
        os.system("sudo apt-get -y update && sudo apt-get -y full-upgrade")
    elif os.path.exists("/usr/bin/dnf"):
        os.system("sudo dnf -y upgrade")
    elif os.path.exists("/usr/bin/zypper"):
        os.system("sudo zypper --non-interactive update")
    elif os.path.exists("/usr/bin/pacman"):
        os.system("sudo pacman -Syu")

# Función de actualización de paquetes
def update_all():
    if os.path.exists("/usr/bin/apt-get"):
        os.system("sudo apt-get -y update && sudo apt-get -y upgrade")
    elif os.path.exists("/usr/bin/dnf"):
        os.system("sudo dnf -y upgrade")
    elif os.path.exists("/usr/bin/zypper"):
        os.system("sudo zypper --non-interactive update")
    elif os.path.exists("/usr/bin/pacman"):
        os.system("sudo pacman -Syu")

# Función para hacer una actualización de todos los paquetes
# y luego una limpieza de archivos que ya no serán útiles
def clean_full_update():
    full_update()
    clean_packages()

# Función para verificar si un comando está disponible
def command_exists(cmd):
    return os.system(f"command -v {cmd} >/dev/null 2>&1") == 0

# Impresión de menu, para visualizar el programa de forma cíclica
while True:
    # Verificar si figlet y lolcat están instalados
    if command_exists("figlet") and command_exists("lolcat"):
        os.system("figlet -f 3d.flf -w 120 'System' | lolcat")
        os.system("figlet -f 3d.flf -w 120 'Maintenance' | lolcat")
    else:
    # Si las dependencias no existen, el programa solo imprimirá un texto
        print("\n System Maintenance\n")

    print("Seleccione la acción que desea realizar:\n")
    options = ["Limpiar paquetes", "Actualización completa", "Actualizar todos los paquetes", "Actualización completa y limpieza de paquetes", "Salir"]

    for i in range(len(options)):
        print(f"{i+1}. {options[i]}")

    choice = input("\nIngrese el número de su elección: ")
    try:
        choice = int(choice)
        if choice < 1 or choice > len(options):
            raise ValueError
    except ValueError:
        print("Opción inválida.\n")
        continue

    if choice == 1:
        clean_packages()
    elif choice == 2:
        full_update()
    elif choice == 3:
        update_all()
    elif choice == 4:
        clean_full_update()
    elif choice == 5:
        break
    else:
        print("Opción inválida.\n")
        continue
