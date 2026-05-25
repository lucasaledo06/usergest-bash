# usergest-bash
# Usergest

Usergest es una herramienta en Bash para la gestión de usuarios y grupos en Linux mediante un menú interactivo.

---

## Menú principal

1. Crear usuario  
2. Crear contraseña  
3. Crear grupo  
4. Añadir usuario a grupo  
5. Ver datos usuario  
6. Borrar usuario  
7. Borrar grupo  
0. Salir  

---

## Funciones

### 1. Crear usuario
Crea un usuario nuevo con directorio home en `/home` y shell `/bin/bash`.

### 2. Crear contraseña
Asigna o cambia la contraseña de un usuario usando `chpasswd`.

### 3. Crear grupo
Crea un grupo si no existe.

### 4. Añadir usuario a grupo
Añade un usuario a un grupo con `usermod -aG`.

### 5. Ver datos usuario
Muestra información del usuario con `id`.

### 6. Borrar usuario
Elimina usuario y su home.

### 7. Borrar grupo
Elimina un grupo del sistema.

---

## Requisitos

- Linux (Debian/Ubuntu)
- root o sudo
- bash
- figlet (opcional)

---

## Ejecución

```bash
chmod +x usergest.sh
sudo bash usergest.sh