import matplotlib.image as image




img=image.imread('prueba.jpg')
imagen_lista=img.tolist()

#convertir a escala de grises
imagen_grises=[]
for i in imagen_lista:
    linea=[]
    for j in i:
        pixel=0.299*j[0]+0.587*j[1]+0.114*j[2]
        linea.append(int(pixel))
    imagen_grises.append(linea)

#print(imagen_grises)

f = open("imagen_binario.rbf", "w")

for i in imagen_grises:
    for j in i:
        getbinary = lambda x, n: format(x, 'b').zfill(n)
        f.write(getbinary(j, 8))

f.close()


