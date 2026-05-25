# Usergest
Usergest es una herramienta en Bash para la gestión de usuarios y grupos en sistemas Linux. Permite realizar tareas básicas de administración desde un menú interactivo en terminal.

---

## Funcionalidades

Con Usergest puedes:

- Crear usuarios del sistema
- Eliminar usuarios
- Asignar contraseñas a usuarios
- Crear grupos
- Añadir usuarios a grupos
- Ver información de usuarios
- Eliminar grupos

---

## Requisitos

- Sistema Linux (Debian, Ubuntu o similar)
- Permisos de administrador (root o sudo)
- Paquetes básicos:
  - bash
  - figlet (opcional para el título)

Instalar dependencias (figlet si no la tiene):

```bash
sudo apt install figlet
```

Para ejecutar este programa debe usar el siguiente comando
```bash
sudo bash usergest.bash
```