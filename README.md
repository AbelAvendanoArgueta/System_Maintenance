# Mantenimiento del sistema
Este script de Bash te permite realizar diferentes tareas de mantenimiento en tu sistema, como limpiar paquetes, actualizar paquetes y actualizar todo el sistema.

## Requisitos previos
Este script utiliza comandos específicos de Linux, por lo que debes tener un sistema Linux instalado para ejecutar este script.

## Uso
<ol>
<li>Abre una terminal en tu sistema Linux.</li>
<li>Descarga el archivo del script 'system-maintenance.sh'.</li>
<li>Ejecuta el script con el siguiente comando:</li>

<p>bash</p>

<pre><code>./system-maintenance.sh
</code></pre>

<li>Se mostrará un menú con las siguientes opciones:</li>

* Limpiar paquetes
* Actualización completa
* Actualizar todos los paquetes
* Limpiar y actualizar
* Salir

<li>Selecciona una opción ingresando el número correspondiente y presionando Enter.</li>

<li>Si has seleccionado una opción de actualización, se te pedirá que ingreses tu contraseña de administrador.</li>

<li>El script realizará la tarea correspondiente y volverá a mostrar el menú.</li>
</ol>

## Funciones
El script tiene las siguientes funciones:

* **clean_packages():** Limpia los paquetes de sistema que ya no son necesarios.
* **full_update():** Realiza una actualización completa del sistema.
* **update_all():** Actualiza todos los paquetes del sistema.
* **clean_full_update():** Limpia los paquetes y realiza una actualización completa del sistema.

## Atribuciones
Este script utiliza el paquete figlet y lolcat para mostrar el texto en la terminal. Los créditos corresponden a los autores originales.

## Licencia

```
         DO WHAT THE FUCK YOU WANT TO PUBLIC LICENSE
                    Version 2, December 2004

 Copyright (C) 2021 Abel Avendaño <jaegerfer7avendano@gmail.com>

 Everyone is permitted to copy and distribute verbatim or modified
 copies of this license document, and changing it is allowed as long
 as the name is changed.

            DO WHAT THE FUCK YOU WANT TO PUBLIC LICENSE
   TERMS AND CONDITIONS FOR COPYING, DISTRIBUTION AND MODIFICATION

  0. You just DO WHAT THE FUCK YOU WANT TO.
```