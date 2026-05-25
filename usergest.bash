#!/bin/bash

crear_usuarios(){
	read -p "Introduce el nombre del usuario a crear: " usr
	while id $usr &>/dev/null
	do
		echo "El usuario $usr existe, intentelo de nuevo"
		read -p "Introduce el nombre del usuario a crear: " usr
	done

	echo ""
	useradd -m -s "/bin/bash" $usr
	echo "Se ha creado el usuario $usr"
	read -p "Pulsa enter para continuar..."
	menu_inicial
}

crear_contraseña(){
	read -p "Introduzca el usuario al que desea asignarle una contraseña: " usr

	if id $usr &>/dev/null
	then
		read -s -p "Introduce la contraseña para $usr: " pwd
		echo
		echo "$usr:$pwd" | chpasswd
		echo ""
		echo "Se ha asignado correctamente la contraseña al usuario $usr"
		read -p "Pulsa enter para continuar..."
		menu_inicial
	else
		read -p "Error: el usuario $usr no existe ¿desea crearlo? (y/N): " res
		if [ "$res" = "y" ]
		then
			clear
			crear_usuarios
		else
			clear
			crear_contraseña
		fi
	fi
}

crear_grupo(){
	read -p "Introduce el nombre del grupo que desea crear: " grp

	if getent group $grp &>/dev/null
	then
		echo "Error: el grupo $grp ya existe en el sistema, intentelo de nuevo"
		crear_grupo
	else
		groupadd $grp
		echo "grupo $grp añadido correctamente"
		read -p "Pulsa enter para continuar..."
		menu_inicial
	fi
}

usuarios_a_grupo(){
	read -p "Introduzca el usuario al que desea mover: " usr

	if id $usr &>/dev/null
	then
		read -p "Introduce el grupo al que quiere meter $usr: " grp

		if getent group $grp &>/dev/null
		then
			echo "Añadiendo $usr al grupo $grp"
			usermod -aG $grp $usr
			echo "se ha añadido el usuario $usr al grupo $grp"
			read -p "Pulsa enter para continuar..."
			menu_inicial
		else
			read -p "Error: el grupo $grp no existe ¿desea crearlo? (y/N): " res
			if [ "$res" = "y" ]
			then
				crear_grupo
			else
				usuarios_a_grupo
			fi
		fi
	else
		read -p "Error: el usuario $usr no existe ¿desea crearlo? (y/N): " res
		if [ "$res" = "y" ]
		then
			crear_usuarios
		else
			usuarios_a_grupo
		fi
	fi
}

datos_usuario(){
	read -p "¿Que usuario quiere observar?: " usr

	if id $usr &>/dev/null
	then
		echo "---- Datos de $usr ----"
		echo ""
		id $usr
		echo ""
		echo "-----------------------"
		echo ""
		read -p "Pulsa enter para continuar..."
		menu_inicial
	else
		read -p "Error: el usuario $usr no existe ¿desea crearlo? (y/N): " res
		if [ "$res" = "y" ]
		then
			crear_usuarios
		else
			datos_usuario
		fi
	fi
}

borrar_usuarios(){
	read -p "Introduce el usuario que desea borrar (intro para volver): " usr

	if [ -z "$usr" ]
	then
		menu_inicial
	else
		if id $usr &>/dev/null
		then
			read -p "ADVERTENCIA: ¿Está seguro de que quiere eliminar $usr? (y/N): " res
			if [ "$res" = "y" ]
			then
				echo ""
				echo "borrando el usuario $usr"
				userdel $usr
				rm -rf /home/$usr
				sleep 1
				echo "usuario $usr borrado del sistema"
				echo ""
				read -p "Pulsa enter para continuar..."
				menu_inicial
			else
				menu_inicial
			fi
		else
			echo "Error: el usuario $usr no existe, vuelva a intentarlo"
			borrar_usuarios
		fi
	fi
}

borrar_grupos(){
	read -p "Introduce el grupo que desea borrar (intro para volver): " grp

	if [ -z "$grp" ]
	then
		menu_inicial
	else
		if getent group $grp &>/dev/null
		then
			read -p "ADVERTENCIA: ¿Está seguro de que quiere eliminar $grp? (y/N): " res
			if [ "$res" = "y" ]
			then
				echo ""
				echo "borrando el grupo $grp"
				groupdel $grp
				sleep 1
				echo "grupo $grp borrado del sistema"
				echo ""
				read -p "Pulsa enter para continuar..."
				menu_inicial
			else
				menu_inicial
			fi
		else
			echo "Error: el grupo $grp, vuelva a intentarlo"
			borrar_grupos
		fi
	fi
}

# 🔐 ROOT CHECK
if [ "$EUID" -ne 0 ]
then
	echo "Error: Debes ser root para ejecutar este programa (uso: sudo bash $0)"
	exit 1
fi

carga(){
	clear
	figlet "usergest"
	sleep 2
	clear
}

menu_inicial(){
	clear

	echo "1. Crear usuario"
	echo "2. Crear contraseña"
	echo "3. Crear grupo"
	echo "4. Añadir usuario a grupo"
	echo "5. Ver datos usuario"
	echo "6. Borrar usuario"
	echo "7. Borrar grupo"
	echo "0. Salir"

	read -p "Opción: " op

	case $op in
	1) crear_usuarios ;;
	2) crear_contraseña ;;
	3) crear_grupo ;;
	4) usuarios_a_grupo ;;
	5) datos_usuario ;;
	6) borrar_usuarios ;;
	7) borrar_grupos ;;
	0) exit ;;
	*) echo "Opción no válida"; sleep 1; menu_inicial ;;
	esac
}

# 🚀 INICIO
carga
menu_inicial