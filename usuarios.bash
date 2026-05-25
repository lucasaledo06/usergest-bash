#!/bin/bash

function carga() {
    clear
    figlet "usergest"
    sleep 2
    clear
}

function crear_usuarios() {
    clear

    read -p "Introduce el nombre del usuario a crear: " user

    sudo useradd -m -d /home/$user -s /bin/bash "$user"
    sudo passwd "$user"

    read -p "¿Desea volver a crear otro? (1=si / 0=no): " af

    if [ "$af" == "1" ]; then
        crear_usuarios
    else
        menu
    fi
}

function menu() {
    echo "¡Advertencia! Ejecute con sudo si es necesario"
    sleep 2
    clear

    echo "Bienvenido/a al programa ¿qué desea hacer?"
    echo "1. Crear un usuario"
    echo "0. Salir"

    read -p "Introduzca la opción: " op

    case $op in
        1)
            crear_usuarios
            ;;
        0)
            echo "Saliendo..."
            exit 0
            ;;
        *)
            echo "Opción no válida"
            menu
            ;;
    esac
}

carga
menu