# Proyecto2-Arquitectura de Computadores I
Diseño e implementación en hardware de un Application Specific Instruction Set Processor (ASIP) para generación de interpolación de imágenes usando interpolación bilineal.

**1. Intérprete**

- Inicialmente se programar el código que se desea procesar en un archivo .asm 
utilizando el ISA propuesto.
- Seguidamente se debe ejecutar el programa “interprete.py” y cuando este 
pregunte por el archivo a compilar debe colocar el nombre completo junto con 
la extensión del archivo que así desea.
![alt text](https://github.com/Pablouc/Specific-Instruction-Set-Processor/blob/Pablo/Readme-Images/1-b.PNG)
- Se le generará un archivo de salida binario en el mismo directorio donde esta 
el archivo .py. Que son las instrucciones en binario que el procesador ejecutará.

<img src="https://github.com/Pablouc/Specific-Instruction-Set-Processor/blob/Pablo/Readme-Images/1-c.PNG" width="400" height="400">

**2. Imagen de entrada**

- Inicialmente se debe tener una imagen que sea de 390x390 en escala de 
grises.
- Seguidamente se debe ejecutar el programa llamado “image_to_decimal.py” y 
cuando este le solicite el nombre de la imagen debe colocar el nombre del 
archivo que desea procesar.
![alt text](https://github.com/Pablouc/Specific-Instruction-Set-Processor/blob/Pablo/Readme-Images/2-b.PNG)
- Se le creará un archivo con la imagen en decimal la cual será la se usará en 
el procesador.
<img src="https://github.com/Pablouc/Specific-Instruction-Set-Processor/blob/Pablo/Readme-Images/2-c.PNG" width="400" height="600">


**3. Procesador**
- Una vez la imagen de entrada y las instrucciones se encuentran cargadas 
en la RAM y en la ROM según corresponda se debe abrir Quartus.
- Si el archivo “processor.sv” no esta como top module se debe de colocar y 
correr el “Analysis and Synthesis” que aparece en la imagen.
<img src="https://github.com/Pablouc/Specific-Instruction-Set-Processor/blob/Pablo/Readme-Images/3-b.PNG" width="400" height="600">

-  Debe abrir Model Sim y ejecutar el siguiente comando 
“vsim -L altera_mf_ver -L lpm_ver processor_tb”.
<img src="https://github.com/Pablouc/Specific-Instruction-Set-Processor/blob/Pablo/Readme-Images/3-c.PNG" width="900" height="300">

- Se generará la imagen de salida en un archivo llamado “output.txt” donde 
esta la imagen en formato binario.
<img src="https://github.com/Pablouc/Specific-Instruction-Set-Processor/blob/Pablo/Readme-Images/3-d.PNG" width="400" height="500">


**4. Imagen de salida**
- Una vez que se tiene la imagen de salida se debe ejecutar el programa 
llamado “decimal_to_image.txt” y cuando se pregunte por el texto a 
convertir debe colocar el nombre del archivo de la imagen de salida.
- Y se genera la imagen de nuevo



