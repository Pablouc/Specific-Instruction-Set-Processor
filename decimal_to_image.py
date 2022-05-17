import matplotlib.image as image
import matplotlib.pyplot as plt
import numpy as np


nombre_imagen=input("Ingrese el nombre del texto a convertir \n")

file1 = open(nombre_imagen, 'r')
count = 0
cont_filas=0

lista_imagen=[]

fila1=[]
fila2=[]
fila3=[]
fila4=[]

matriz_inter=[0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0]



while True:

    # Get next line from file
    line = file1.readline()

    # if line is empty
    # end of file is reached
    if not line:
        break

    binary_string=line[32:]
    number=int(binary_string,2)


    #ordenar la matriz desde el orden de los store
    if(count==0):
        matriz_inter[0]=number
    elif(count==1):
        matriz_inter[3]=number
    elif(count==2):
        matriz_inter[12]=number
    elif(count==3):
        matriz_inter[15]=number
    elif(count==4):
        matriz_inter[1]=number
    elif(count==5):
        matriz_inter[2]=number
    elif(count==6):
        matriz_inter[4]=number
    elif(count==7):
        matriz_inter[8]=number
    elif(count==8):
        matriz_inter[13]=number
    elif(count==9):
        matriz_inter[14]=number
    elif(count==10):
        matriz_inter[7]=number
    elif(count==11):
        matriz_inter[11]=number
    elif(count==12):
        matriz_inter[5]=number
    elif(count==13):
        matriz_inter[6]=number
    elif(count==14):
        matriz_inter[9]=number
    elif(count==15):
        matriz_inter[10]=number
    else:
        None

    count+=1

    #una vez que una matriz esta llena, agrege los espacios a cada una de las filas
    if(count>=16):
        print(matriz_inter)
        count=0
        fila1.append(matriz_inter[0])
        fila1.append(matriz_inter[1])
        fila1.append(matriz_inter[2])
        fila1.append(matriz_inter[3])
        fila2.append(matriz_inter[4])
        fila2.append(matriz_inter[5])
        fila2.append(matriz_inter[6])
        fila2.append(matriz_inter[7])
        fila3.append(matriz_inter[8])
        fila3.append(matriz_inter[9])
        fila3.append(matriz_inter[10])
        fila3.append(matriz_inter[11])
        fila4.append(matriz_inter[12])
        fila4.append(matriz_inter[13])
        fila4.append(matriz_inter[14])
        fila4.append(matriz_inter[15])

        break




    cont_filas+=1
    #Cantidad de pixeles en una "fila" de matrices
    if(len(fila1)>=96):
        lista_imagen.append(fila1)
        lista_imagen.append(fila2)
        lista_imagen.append(fila3)
        lista_imagen.append(fila4)
        fila1=[]
        fila2=[]
        fila3=[]
        fila4=[]
        cont_filas=0
    
    
print(lista_imagen)
plt.imshow(np.array(lista_imagen), cmap='gray', vmin = 0, vmax = 255)
plt.show()