# Parte 1: Preparación del Entorno

## Configuración de la Máquina Virtual

### Especificaciones de Hardware
- **RAM**: 2–4 GB
- **CPU**: 2 núcleos
- **Almacenamiento**: 20–40 GB
- **Sistema Operativo**: Ubuntu Server 22.04 LTS

## Actualización del Sistema

```bash
sudo apt update
sudo apt upgrade -y
```

## Instalación de Apache

```bash
# Instalar Apache como servidor web
sudo apt install apache2 -y

# Habilitar Apache para inicio automático
sudo systemctl enable apache2
sudo systemctl start apache2
```

## Instalación de MariaDB

```bash
# Instalar MariaDB
sudo apt install mariadb-server -y

# Asegurar la instalación
sudo mysql_secure_installation

# Crear base de datos y usuario
sudo mysql -u root -p
```

### Configuración de Base de Datos

```sql
CREATE DATABASE glpidb;
CREATE USER 'glpiuser'@'localhost' IDENTIFIED BY 'password';
GRANT ALL PRIVILEGES ON glpidb.* TO 'glpiuser'@'localhost';
FLUSH PRIVILEGES;
EXIT;
```

## Instalación de PHP 8.x

```bash
# Instalar PHP con todos los módulos requeridos
sudo apt install php php-mysql php-xml php-intl php-ldap php-apcu php-mbstring php-zip php-gd php-curl php-cli php-bz2 -y
```

### Configuración de Límites de PHP

Editar archivo de configuración de PHP:

```bash
sudo nano /etc/php/8.x/apache2/php.ini
```

Modificar los siguientes valores:

```ini
memory_limit = 512M
upload_max_filesize = 128M
post_max_size = 128M
```

### Reiniciar Apache

```bash
sudo systemctl restart apache2
```

## Configuración de Firewall

```bash
# Permitir tráfico HTTP y HTTPS
sudo ufw allow http
sudo ufw allow https
sudo ufw enable
```

## Verificación

Verificar que todos los servicios estén funcionando correctamente antes de proceder con la instalación de GLPI.
