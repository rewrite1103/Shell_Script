#!/bin/bash

# se accede a la carpeta donde se va a crear el archivo
cd /home/elton/Escritorio/Shell_Script/

# se define la variable Nombre_archivo 
# con el nombre del archivo que se va a crear
Nombre_archivo="procesos-$(date +%Y-%m-%d).list"


# se verifica si el archivo existe
if [ -e $Nombre_archivo ]; then
# si existe se agrega la informacion al final del archivo

    top -b -n 1 | head -n 12 >> $Nombre_archivo
else
# si no existe se crea el archivo y se agrega la informacion

    top -b -n 1 | head -n 12 > $Nombre_archivo 
fi

# descripcion del crontab
# * * * * * /home/elton/Escritorio/Shell_Script/System_Status.sh
