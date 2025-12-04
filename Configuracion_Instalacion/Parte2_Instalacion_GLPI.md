# Parte 2: Instalación de GLPI 10

## Descarga e Instalación de GLPI

### Descargar GLPI 10.0.14

```bash
cd /var/www/html
sudo wget https://github.com/glpi-project/glpi/releases/download/10.0.14/glpi-10.0.14.tgz
sudo tar -xvzf glpi-10.0.14.tgz
```

### Configurar Permisos

```bash
sudo chown -R www-data:www-data /var/www/html/glpi
sudo chmod -R 755 /var/www/html/glpi
```

## Configuración de VirtualHost (Opcional)

Se puede configurar un VirtualHost para una URL limpia.

```bash
sudo nano /etc/apache2/sites-available/glpi.conf
```

Contenido básico del VirtualHost:

```apache
<VirtualHost *:80>
    DocumentRoot /var/www/html/glpi
    
    <Directory /var/www/html/glpi>
        AllowOverride All
        Require all granted
    </Directory>
</VirtualHost>
```

Habilitar el sitio:

```bash
sudo a2ensite glpi.conf
sudo systemctl reload apache2
```

## Instalación Web de GLPI

### Completar Instalación desde el Navegador

1. Acceder a GLPI desde navegador
2. Configurar conexión a MySQL:
   - Base de datos: `glpidb`
   - Usuario: `glpiuser`
   - Contraseña: (la configurada anteriormente)
3. Completar el asistente de instalación

### Credenciales de Usuario Administrador por Defecto

**Usuario administrador**: `glpi`  
**Contraseña**: `glpi`

⚠️ **IMPORTANTE**: Esta contraseña fue cambiada al finalizar la instalación por seguridad.

## Seguridad Post-Instalación

### Eliminar Instalador

```bash
sudo rm -rf /var/www/html/glpi/install
```

## Configuración de Tareas Automáticas

### Configurar Cron para Ejecución Cada 5 Minutos

```bash
sudo crontab -e
```

Agregar la siguiente línea:

```cron
*/5 * * * * php /var/www/html/glpi/front/cron.php
```

## Verificación Final

Acceder a GLPI y verificar que el dashboard cargue correctamente y que las tareas automáticas estén funcionando.
