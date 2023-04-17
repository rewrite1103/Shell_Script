#!/bin/bash

#Se inicializan tres variables, una de cadena vacía 
# y dos variables numéricas a cero.
romano=""
numero_ent=0
caract_ent=0

#Se define una función que toma un carácter como entrada y asigna el valor 
#numérico correspondiente de acuerdo con las reglas de conversión de números romanos.
function Convert_Caracter_to_Ent () {
    # Se utiliza la estructura if-elif-else para asignar el valor numérico
    if [[ $1 = "I" || $1 = "i" ]]
    then  
    caract_ent=1
    elif [[ $1 = "V" || $1 = "v" ]]
    then
    caract_ent=5
    elif [[ $1 = "X" ||  $1 = "x" ]]
    then
    caract_ent=10
    elif [[ $1 = "L" ||  $1 = "l" ]]
    then
    caract_ent=50
    elif [[ $1 = "C" ||  $1 = "c" ]]
    then
    caract_ent=100
    elif [[ $1 = "D" ||  $1 = "d" ]]
    then
    caract_ent=500
    elif [[ $1 = "M" ||  $1 = "m" ]]
    then
    caract_ent=1000
    else
    echo "El cadena no es un numero romano"
    exit
    fi  
}

#Se define una función que convierte una cadena de caracteres que representa 
# un número romano en un número entero.
function Convert_Romano_to_ent () {
    #Se utiliza la estructura if-else para verificar si la cadena está vacía.
   if [ -z $romano ];
   then
   #Si la cadena está vacía se imprime un mensaje de error.
   echo "La cadena esta vacia"
   else
    #Se utiliza la estructura for para recorrer la cadena de caracteres.
    for i in $(seq 0 `expr ${#romano} - 1`)
    do
    #Se utiliza la estructura if-elif-else para verificar si es el primer carácter.
    if [ $i == 0 ]
    then
    # Si es el primer carácter se llama a la función Convert_Caracter_to_Ent
    Convert_Caracter_to_Ent ${romano:$i:1}
    # Se asigna el valor de la variable caract_ent a la variable numero_ent.
    # Sumando asi el valor del primer carácter.
    numero_ent=$caract_ent
    else
    # Si no es el primer carácter se llama a la función Convert_Caracter_to_Ent
    
    #se obtiene el valor del caracter actual y se almacena el la variable $actual.
    Convert_Caracter_to_Ent ${romano:$i:1}
    actual=$caract_ent

    #se obtiene el valor del caracter anterior y se almacena el la variable $anterior.
    Convert_Caracter_to_Ent ${romano:`expr $i - 1`:1}
    anterior=$caract_ent

    #Se utiliza la estructura if-elif-else para validar si el valor del caracter anterior
    #es mayor o igual al valor del caracter actual.
     if [ $anterior -ge $actual ];
     then
     # Si se cumple la condición se suma el valor del caracter actual a la variable numero_ent.
     numero_ent=`expr $numero_ent + $actual`
     else
     # Si no se cumple la condición se resta el valor del caracter anterior multiplicado por 2
     # al valor de la variable numero_ent y se suma el valor del caracter actual.
     numero_ent=`expr $numero_ent - 2 \* $anterior + $actual`
    
     fi
    fi

    done
   fi
   # Se imprime el valor de la variable numero_ent.
    echo "El numero entero es: $numero_ent"

}

#Se pide al usuario que ingrese un número romano y se lee el valor de la cadena.
# almecenando la cadena en la variable romano.
echo "Ingrese un numero romano: "
read romano

#Se llama a la función Convert_Romano_to_ent para convertir el número romano
Convert_Romano_to_ent

 

