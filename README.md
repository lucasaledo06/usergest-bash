# usergest-bash
# Usergest
<img width="433" height="114" alt="image" src="https://github.com/user-attachments/assets/348b106b-b1d1-4ada-a046-dcfabc43b42c" />

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
<img width="510" height="131" alt="image" src="https://github.com/user-attachments/assets/8bead82c-9ee7-4344-9838-88fdbb48eff5" />


### 2. Crear contraseña
Asigna o cambia la contraseña de un usuario usando `chpasswd`.
<img width="691" height="158" alt="image" src="https://github.com/user-attachments/assets/97a55e42-35bc-4503-b17d-0d4a625b0107"/>

### 3. Crear grupo
Crea un grupo si no existe.
<img width="537" height="100" alt="image" src="https://github.com/user-attachments/assets/ba4cf69a-43e3-4f8c-81fd-0b6d5e7186ee" />



### 4. Añadir usuario a grupo
Añade un usuario a un grupo con `usermod -aG`.
<img width="552" height="152" alt="image" src="https://github.com/user-attachments/assets/72d5362a-80c4-4237-b685-bcf9e9fe77c9" />

### 5. Ver datos usuario
Muestra información del usuario con `id`.
<img width="789" height="217" alt="image" src="https://github.com/user-attachments/assets/29525b8f-b652-4ad0-b1e0-7d3d558c2159" />


### 6. Borrar usuario
Elimina usuario y su home.
<img width="701" height="202" alt="image" src="https://github.com/user-attachments/assets/1bafad59-4739-41d2-9312-ecca02f2b847" />


### 7. Borrar grupo
Elimina un grupo del sistema.
<img width="651" height="212" alt="image" src="https://github.com/user-attachments/assets/253e014f-d95d-44d0-83ab-2fd56daaa4cd" />

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
