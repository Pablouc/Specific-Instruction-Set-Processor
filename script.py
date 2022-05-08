
import matplotlib.image as image
import matplotlib.pyplot as plt
import numpy as np

def original():
    #cantidad de matrices:alto
    #cantidad de filas:ancho
    #http://support.ptc.com/help/mathcad/es/index.html#page/PTC_Mathcad_Help/example_grayscale_and_color_in_images.html
    #ingresa imagen
    cuadrante=input("Ingrese el numero del cuadrante \n")
    cuadrante=int(cuadrante)
    img=image.imread('prueba.jpg')
    fila_cuadrante=cuadrante//4
    columna_cuadrante=cuadrante%4
    imagen_cuadrante=[]
    
    #selecciona cuadrante
    for i in range(96*fila_cuadrante,96*(fila_cuadrante+1)):
        matriz_vacia=[]
        for j in range(96*columna_cuadrante,96*(columna_cuadrante+1)):
            matriz_vacia.append(img[i][j].tolist())
        imagen_cuadrante.append(matriz_vacia)

    #convertir a escala de grises
    imagen_grises=[]
    for i in imagen_cuadrante:
        linea=[]
        for j in i:
            pixel=0.299*j[0]+0.587*j[1]+0.114*j[2]
            linea.append(int(pixel))
        imagen_grises.append(linea)
    
    """"
    mat=[]
    fila_vacia= []

    for i in range(96):
        fila_vacia.append(0)
    print(fila_vacia)

    for i in imagen_grises:
        fila=[]
        primera=True
        for j in i:
            fila.append(j)
            if(primera):
                fila.append(0)
                fila.append(0)
            primera=not primera
        mat.append(fila)
        mat.append(fila)
        mat.append(fila)
        #mat.append(fila_vacia)
        #mat.append(fila_vacia)
    #print(mat)"""





    
    #ff=[[45,45,45],[23,90,213]]
    #imgplot = plt.imshow(imagen_cuadrante)
    plt.imshow(imagen_grises, cmap='gray', interpolation="none", vmin = 0, vmax = 255)
    plt.show()


def entera():
    #cantidad de matrices:alto
    #cantidad de filas:ancho
    #http://support.ptc.com/help/mathcad/es/index.html#page/PTC_Mathcad_Help/example_grayscale_and_color_in_images.html
    #ingresa imagen
    cuadrante=input("Ingrese el numero del cuadrante \n")
    cuadrante=int(cuadrante)
    img=image.imread('prueba.jpg')
    fila_cuadrante=cuadrante//4
    columna_cuadrante=cuadrante%4
    imagen_cuadrante=[]
    
    #selecciona cuadrante
    for i in range(96*fila_cuadrante,96*(fila_cuadrante+1)):
        matriz_vacia=[]
        for j in range(96*columna_cuadrante,96*(columna_cuadrante+1)):
            matriz_vacia.append(img[i][j].tolist())
        imagen_cuadrante.append(matriz_vacia)

    #convertir a escala de grises
    imagen_grises=[]
    for i in imagen_cuadrante:
        linea=[]
        for j in i:
            pixel=0.299*j[0]+0.587*j[1]+0.114*j[2]
            linea.append(int(pixel))
        imagen_grises.append(linea)
    



    gg=np.array(imagen_grises)
    out = np.zeros((384, 384, 3))
    gg2=interpolate_bilinear_integer(img, 96, 96, out, 384, 384)

    """"
    mat=[]
    fila_vacia= []

    for i in range(96):
        fila_vacia.append(0)
    print(fila_vacia)

    for i in imagen_grises:
        fila=[]
        primera=True
        for j in i:
            fila.append(j)
            if(primera):
                fila.append(0)
                fila.append(0)
            primera=not primera
        mat.append(fila)
        mat.append(fila)
        mat.append(fila)
        #mat.append(fila_vacia)
        #mat.append(fila_vacia)
    #print(mat)"""



    #ff=[[45,45,45],[23,90,213]]
    #imgplot = plt.imshow(imagen_cuadrante)
    plt.imshow(imagen_grises, cmap='gray', vmin = 0, vmax = 255, interpolation="bilinear")
    
    plt.show()

def flotante():
        #cantidad de matrices:alto
    #cantidad de filas:ancho
    #http://support.ptc.com/help/mathcad/es/index.html#page/PTC_Mathcad_Help/example_grayscale_and_color_in_images.html
    #ingresa imagen
    cuadrante=input("Ingrese el numero del cuadrante \n")
    cuadrante=int(cuadrante)
    img=image.imread('prueba.jpg')
    fila_cuadrante=cuadrante//4
    columna_cuadrante=cuadrante%4
    imagen_cuadrante=[]
    
    #selecciona cuadrante
    for i in range(96*fila_cuadrante,96*(fila_cuadrante+1)):
        matriz_vacia=[]
        for j in range(96*columna_cuadrante,96*(columna_cuadrante+1)):
            matriz_vacia.append(img[i][j].tolist())
        imagen_cuadrante.append(matriz_vacia)

    #convertir a escala de grises
    imagen_grises=[]
    for i in imagen_cuadrante:
        linea=[]
        for j in i:
            pixel=0.299*j[0]+0.587*j[1]+0.114*j[2]
            linea.append(int(pixel))
        imagen_grises.append(linea)
    



    gg=np.array(imagen_grises)
    out = np.zeros((384, 384, 3))
    gg2=interpolate_bilinear_flotante(img, 96, 96, out, 384, 384)

    """"
    mat=[]
    fila_vacia= []

    for i in range(96):
        fila_vacia.append(0)
    print(fila_vacia)

    for i in imagen_grises:
        fila=[]
        primera=True
        for j in i:
            fila.append(j)
            if(primera):
                fila.append(0)
                fila.append(0)
            primera=not primera
        mat.append(fila)
        mat.append(fila)
        mat.append(fila)
        #mat.append(fila_vacia)
        #mat.append(fila_vacia)
    #print(mat)"""



    #ff=[[45,45,45],[23,90,213]]
    #imgplot = plt.imshow(imagen_cuadrante)
    plt.imshow(imagen_grises, cmap='gray', vmin = 0, vmax = 255, interpolation="bilinear")
    
    plt.show()

def interpolate_bilinear_integer(array_in, width_in, height_in, array_out, width_out, height_out):
    for i in range(height_out):
        for j in range(width_out):
            # Relative coordinates of the pixel in output space
            x_out = j / width_out
            y_out = i / height_out

            # Corresponding absolute coordinates of the pixel in input space
            x_in = (x_out * width_in)
            y_in = (y_out * height_in)

            # Nearest neighbours coordinates in input space
            x_prev = int(np.floor(x_in))
            x_next = x_prev + 1
            y_prev = int(np.floor(y_in))
            y_next = y_prev + 1

            # Sanitize bounds - no need to check for < 0
            x_prev = min(x_prev, width_in - 1)
            x_next = min(x_next, width_in - 1)
            y_prev = min(y_prev, height_in - 1)
            y_next = min(y_next, height_in - 1)
            
            # Distances between neighbour nodes in input space
            Dy_next = y_next - y_in;
            Dy_prev = 1. - Dy_next; # because next - prev = 1
            Dx_next = x_next - x_in;
            Dx_prev = 1. - Dx_next; # because next - prev = 1
            
            # Interpolate over 3 RGB layers
            for c in range(3):
                array_out[i][j][c] = Dy_prev * (array_in[y_next][x_prev][c] * Dx_next + array_in[y_next][x_next][c] * Dx_prev) \
                + Dy_next * (array_in[y_prev][x_prev][c] * Dx_next + array_in[y_prev][x_next][c] * Dx_prev)
                
    return array_out



def interpolate_bilinear_flotante(array_in, width_in, height_in, array_out, width_out, height_out):
    for i in range(height_out):
        for j in range(width_out):
            # Relative coordinates of the pixel in output space
            x_out = j / width_out
            y_out = i / height_out

            # Corresponding absolute coordinates of the pixel in input space
            x_in = (x_out * width_in)
            y_in = (y_out * height_in)

            # Nearest neighbours coordinates in input space
            x_prev = float(x_in)
            x_next = x_prev + 1
            y_prev = float(y_in)
            y_next = y_prev + 1

            # Sanitize bounds - no need to check for < 0
            x_prev = min(x_prev, width_in - 1)
            x_next = min(x_next, width_in - 1)
            y_prev = min(y_prev, height_in - 1)
            y_next = min(y_next, height_in - 1)
            
            # Distances between neighbour nodes in input space
            Dy_next = y_next - y_in;
            Dy_prev = 1. - Dy_next; # because next - prev = 1
            Dx_next = x_next - x_in;
            Dx_prev = 1. - Dx_next; # because next - prev = 1

            x_prev = int(np.floor(x_in))
            x_next = x_prev + 1
            y_prev = int(np.floor(y_in))
            y_next = y_prev + 1
            
            # Interpolate over 3 RGB layers
            for c in range(3):
                array_out[i][j][c] = Dy_prev * (array_in[y_next][x_prev][c] * Dx_next + array_in[y_next][x_next][c] * Dx_prev) \
                + Dy_next * (array_in[y_prev][x_prev][c] * Dx_next + array_in[y_prev][x_next][c] * Dx_prev)
                
    return array_out
