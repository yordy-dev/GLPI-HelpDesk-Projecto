# Parte 3: Configuración Profesional de GLPI

## Configuración Organizacional

### Creación de Entidades (Sedes)

Se crearon las siguientes entidades para simular un entorno empresarial multi-sede:

- **Lima** (Sede principal)
- **Arequipa** (Sede regional)
- **Trujillo** (Sede regional)

**Navegación**: Administración → Entidades

## Creación de Grupos Operativos

Se configuraron los siguientes grupos de soporte:

1. **Mesa de Ayuda (Nivel 1)**: Primera línea de atención
2. **Soporte N2**: Soporte técnico de segundo nivel
3. **Infraestructura/Servidores**: Equipo especializado en infraestructura

**Navegación**: Administración → Grupos

## Definición de Perfiles de Usuario

Se crearon los siguientes perfiles:

- **Usuario Final**: Usuarios que reportan incidencias
- **Técnico N1**: Técnicos de primer nivel
- **Técnico N2**: Técnicos de segundo nivel
- **Administrador**: Administradores del sistema

**Navegación**: Administración → Perfiles

## Configuración de Categorías

Se crearon categorías realistas para empresas peruanas:

### Hardware
- Computadoras
- Impresoras
- Periféricos

### Software
- Aplicaciones
- Office 365
- Sistemas ERP (SIAF, SIGA)

### Redes
- Conectividad WiFi
- Redes LAN
- VPN corporativa

### Accesos
- Correo electrónico
- Sistemas institucionales
- Permisos de acceso

### Infraestructura
- Servidores
- Almacenamiento
- Datacenter

**Navegación**: Configuración → Menús desplegables → Categorías de tickets

## Configuración de SLAs

Se definieron los siguientes acuerdos de nivel de servicio:

### SLA - Atención Rápida (1 hora)
- **Aplicable a**: Accesos / Software simple
- **Tiempo de resolución**: 1 hora

### SLA - Resolución Estándar (8 horas)
- **Aplicable a**: Hardware / Redes básicas
- **Tiempo de resolución**: 8 horas

### SLA - Incidencias Críticas (2 horas)
- **Aplicable a**: 
  - Servidor caído
  - Sistema SIAF/SIGA inoperativo
  - Internet de oficina caído
- **Tiempo de resolución**: 2 horas

**Navegación**: Configuración → SLA

## Reglas de Asignación Automática

Se establecieron reglas de asignación automática según:
- **Categoría del ticket**
- **Prioridad del ticket**

Ejemplos:
- Tickets de categoría "Hardware" → Asignación a Mesa de Ayuda
- Tickets de categoría "Infraestructura" → Asignación a grupo Infraestructura/Servidores

**Navegación**: Administración → Reglas → Reglas de asignación de tickets

## Sistema de Notificaciones

Se activaron notificaciones por correo electrónico para los siguientes eventos:

- Ticket creado
- Ticket asignado
- Ticket actualizado
- Ticket cerrado

**Navegación**: Configuración → Notificaciones

## Gestión de Tickets Simulados

Se crearon 10 tickets reales para demostrar la gestión completa del ciclo de vida. Cada ticket incluye:

- Título descriptivo
- Categoría asignada
- Prioridad (Alta, Media, Baja)
- Impacto (Alto, Medio, Bajo)
- Descripción detallada
- Evidencia simulada

### Pasos de Gestión de Tickets

1. **Asignación**: Ticket asignado al grupo correspondiente
2. **Análisis de Impacto**: Evaluación del alcance de la incidencia
3. **Escalamiento**: Si es necesario, escalar a nivel superior
4. **Documentación de Acciones**: Registro de todas las acciones realizadas
5. **Cumplimiento de SLA**: Monitoreo del tiempo de resolución
6. **Cierre con Evidencia**: Cierre documentado con evidencia de solución

## Observaciones Finales

Toda la configuración fue documentada con capturas de pantalla, tablas de tickets, métricas de SLA y descripción detallada de soluciones implementadas.

El proyecto está listo para la gestión de tickets con resolución completa en un entorno de Mesa de Ayuda profesional.
