import matplotlib.image as image
import matplotlib.pyplot as plt
import numpy as np


nombre_imagen=input("Ingrese el nombre del texto a convertir \n")

file1 = open(nombre_imagen, 'r')
count = 0
lista_imagen=[]
fila=[]



while True:
    count += 1
    # if line is empty
    # end of file is reached
    line = file1.readline()
    if not line:
        break

    
    print(int(line))

    lista_imagen.append(int(line))

    
    # Get next line from file

print(np.array_split(np.array(lista_imagen), 4))
plt.imshow(np.array_split(np.array(lista_imagen), 4), cmap='gray', vmin = 0, vmax = 255)
plt.show()