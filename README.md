# Proyecto2-Arquitectura de Computadores I
Diseño e implementación en hardware de un Application Specific Instruction Set Processor (ASIP) para generación de interpolación de imágenes usando interpolación bilineal.

**1. Intérprete**

- Inicialmente se programar el código que se desea procesar en un archivo .asm 
utilizando el ISA propuesto.
- Seguidamente se debe ejecutar el programa “interprete.py” y cuando este 
pregunte por el archivo a compilar debe colocar el nombre completo junto con 
la extensión del archivo que así desea.
- Se le generará un archivo de salida binario en el mismo directorio donde esta 
el archivo .py. Que son las instrucciones en binario que el procesador ejecutará.

**2. Imagen de entrada**

- Inicialmente se debe tener una imagen que sea de 390x390 en escala de 
grises.
- Seguidamente se debe ejecutar el programa llamado “image_to_decimal.py” y 
cuando este le solicite el nombre de la imagen debe colocar el nombre del 
archivo que desea procesar.
- Se le creará un archivo con la imagen en decimal la cual será la se usará en 
el procesador.

**3. Procesador**
- Una vez la imagen de entrada y las instrucciones se encuentran cargadas 
en la RAM y en la ROM según corresponda se debe abrir Quartus.
- Si el archivo “processor.sv” no esta como top module se debe de colocar y 
correr el “Analysis and Synthesis” que aparece en la imagen.
-  Debe abrir Model Sim y ejecutar el siguiente comando 
“vsim -L altera_mf_ver -L lpm_ver processor_tb”
- Se generará la imagen de salida en un archivo llamado “output.txt” donde 
esta la imagen en formato binario.

**4. Imagen de salida**
- Una vez que se tiene la imagen de salida se debe ejecutar el programa 
llamado “decimal_to_image.txt” y cuando se pregunte por el texto a 
convertir debe colocar el nombre del archivo de la imagen de salida.
- Y se genera la imagen de nuevo



