#!/bin/bash

##############################################
# Script de Configuración Inicial GLPI
# Proyecto: GLPI HelpDesk - Mesa de Ayuda
# Autor: Yordy-dev
##############################################

echo "==================================="
echo "GLPI - Script de Configuración"
echo "==================================="

# Variables de configuración
GLPI_PATH="/var/www/html/glpi"
DB_NAME="glpidb"
DB_USER="glpiuser"
BACKUP_DIR="/var/backups/glpi"
DATE=$(date +%Y%m%d_%H%M%S)

# Crear directorio de backups si no existe
if [ ! -d "$BACKUP_DIR" ]; then
    echo "Creando directorio de backups..."
    sudo mkdir -p $BACKUP_DIR
fi

# Función: Backup de Base de Datos
backup_database() {
    echo "Realizando backup de la base de datos..."
    sudo mysqldump -u $DB_USER -p $DB_NAME > $BACKUP_DIR/glpidb_backup_$DATE.sql
    echo "Backup de base de datos completado: glpidb_backup_$DATE.sql"
}

# Función: Backup de Archivos GLPI
backup_files() {
    echo "Realizando backup de archivos GLPI..."
    sudo tar -czf $BACKUP_DIR/glpi_files_$DATE.tar.gz $GLPI_PATH/files
    echo "Backup de archivos completado: glpi_files_$DATE.tar.gz"
}

# Función: Verificar permisos
check_permissions() {
    echo "Verificando permisos de GLPI..."
    sudo chown -R www-data:www-data $GLPI_PATH
    sudo chmod -R 755 $GLPI_PATH
    echo "Permisos verificados y corregidos"
}

# Menú principal
echo ""
echo "Seleccione una opción:"
echo "1. Backup completo (Base de datos + Archivos)"
echo "2. Solo backup de base de datos"
echo "3. Solo backup de archivos"
echo "4. Verificar y corregir permisos"
echo "5. Salir"
echo ""
read -p "Opción: " opcion

case $opcion in
    1)
        backup_database
        backup_files
        ;;
    2)
        backup_database
        ;;
    3)
        backup_files
        ;;
    4)
        check_permissions
        ;;
    5)
        echo "Saliendo..."
        exit 0
        ;;
    *)
        echo "Opción no válida"
        exit 1
        ;;
esac

echo ""
echo "==================================="
echo "Operación completada exitosamente"
echo "==================================="
