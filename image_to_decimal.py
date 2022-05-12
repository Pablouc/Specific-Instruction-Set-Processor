import matplotlib.image as image



nombre_imagen=input("Ingrese el nombre de la imagen a convertir \n")
img=image.imread(nombre_imagen)
imagen_lista=img.tolist()

#convertir a escala de grises
imagen_grises=[]
for i in imagen_lista:
    linea=[]
    termina_matriz=False
    for j in i:
        pixel=0.299*j[0]+0.587*j[1]+0.114*j[2]
        linea.append(int(pixel))
    imagen_grises.append(linea)

#print(imagen_grises)

f = open("ram.mif", "w")

f.write("""WIDTH=24;
DEPTH=65536;

ADDRESS_RADIX=UNS;
DATA_RADIX=UNS;

CONTENT BEGIN\n""")

cont=0
posicion_matriz=0

for i in imagen_grises:
    for j in i:
        #for space
        spaces="       :   "
        spaces=spaces[len(str(cont)):]

        f.write("    "+str(cont)+spaces+str(j)+";\n")

        #posiciones en matriz original
        if(posicion_matriz==0):
            f.write("    "+str(cont+1)+spaces+str(0)+";\n")
            f.write("    "+str(cont+2)+spaces+str(0)+";\n")
            cont+=3
            posicion_matriz+=1
        elif (posicion_matriz==1):
            f.write("    "+str(cont+1)+spaces+str(0)+";\n")
            f.write("    "+str(cont+2)+spaces+str(0)+";\n")
            f.write("    "+str(cont+3)+spaces+str(0)+";\n")
            f.write("    "+str(cont+4)+spaces+str(0)+";\n")
            f.write("    "+str(cont+5)+spaces+str(0)+";\n")
            f.write("    "+str(cont+6)+spaces+str(0)+";\n")
            f.write("    "+str(cont+7)+spaces+str(0)+";\n")
            f.write("    "+str(cont+8)+spaces+str(0)+";\n")
            cont+=9
            posicion_matriz+=1
        elif(posicion_matriz==2):
            f.write("    "+str(cont+1)+spaces+str(0)+";\n")
            f.write("    "+str(cont+2)+spaces+str(0)+";\n")
            cont+=3
            posicion_matriz+=1
        else:
            cont+=1
            posicion_matriz=0

        """f.write(str(j).zfill(3))
        f.write("\n")"""
        

f.write("    ["+str(cont)+"..65535]  :   0;\n")
f.write("END;")

f.close()


