
#int to binary
getbinary = lambda x, n: format(x, 'b').zfill(n)

#identify the register number

def register_num(num):
    if(num=="r1"):
        return "0000"
    if(num=="r2"):
        return "0001"
    if(num=="r3"):
        return "0010"
    if(num=="r4"):
        return "0011"
    if(num=="r5"):
        return "0100"
    if(num=="r6"):
        return "0101"
    if(num=="r7"):
        return "0110"
    if(num=="r8"):
        return "0111"
    if(num=="r9"):
        return "1000"
    if(num=="r10"):
        return "1001"
    if(num=="r11"):
        return "1010"
    if(num=="r12"):
        return "1011"
    if(num=="r13"):
        return "1100"
    if(num=="r14"):
        return "1101"
    



def interprete():
    #get file name
    archivo=input("Ingrese el nombre del archivo a compilar \n")

    #input file 

    file1 = open(archivo, 'r')
    count = 0

    #output file
    output = open("output_binary.rbf", "a")

    #read every line
    while True:
        count += 1
    
        # Get next line from file
        line = file1.readline()
    
        # if line is empty
        # end of file is reached
        if not line:
           break

        #mult
        if (line.find("mult")!=-1):
            list_line=line.split()
            
            #with immediate
            if(list_line[3].isnumeric()):
                #opcode
                output.write("0001")
                #rd
                output.write(register_num(list_line[1]))
                #rs1
                output.write(register_num(list_line[2]))
                #rs2
                output.write("0000")
                #immediate
                binary_num=getbinary(int(list_line[3]), 8)
                output.write(str(binary_num))

                #line jump (can be deleted)
                output.write("\n")

            #no immediate
            else:
                #opcode
                output.write("0000")
                #rd
                output.write(register_num(list_line[1]))
                #rs1
                output.write(register_num(list_line[2]))
                #rs2
                output.write(register_num(list_line[3]))
                #immediate
                output.write("00000000")
                #line jump (can be deleted)
                output.write("\n")

        #div
        if (line.find("div")!=-1):
            list_line=line.split()
            
            #with immediate
            if(list_line[3].isnumeric()):
                #opcode
                output.write("0011")
                #rd
                output.write(register_num(list_line[1]))
                #rs1
                output.write(register_num(list_line[2]))
                #rs2
                output.write("0000")
                #immediate
                binary_num=getbinary(int(list_line[3]), 8)
                output.write(str(binary_num))

                #line jump (can be deleted)
                output.write("\n")

            #no immediate
            else:
                #opcode
                output.write("0010")
                #rd
                output.write(register_num(list_line[1]))
                #rs1
                output.write(register_num(list_line[2]))
                #rs2
                output.write(register_num(list_line[3]))
                #immediate
                output.write("00000000")
                #line jump (can be deleted)
                output.write("\n")

        #add
        if (line.find("add")!=-1):
            list_line=line.split()

            #with immediate
            if(list_line[3].isnumeric()):
                #opcode
                output.write("1111")
                #rd
                output.write(register_num(list_line[1]))
                #rs1
                output.write(register_num(list_line[2]))
                #rs2
                output.write("0000")
                #immediate
                binary_num=getbinary(int(list_line[3]), 8)
                output.write(str(binary_num))

                #line jump (can be deleted)
                output.write("\n")

            #no immediate
            else:
                #opcode
                output.write("0100")
                #rd
                output.write(register_num(list_line[1]))
                #rs1
                output.write(register_num(list_line[2]))
                #rs2
                output.write(register_num(list_line[3]))
                #immediate
                output.write("00000000")
                #line jump (can be deleted)
                output.write("\n")

        #load
        if (line.find("ld")!=-1):
            list_line=line.split()
            
            #with immediate
            if(len(list_line)>3):
                #opcode
                output.write("0101")
                #rd
                output.write(register_num(list_line[1]))
                #rs1
                output.write(register_num(list_line[2]))
                #immediate
                binary_num=getbinary(int(list_line[3]), 12)
                output.write(str(binary_num))

                #line jump (can be deleted)
                output.write("\n")

            #no immediate
            else:
                #opcode
                output.write("0101")
                #rd
                output.write(register_num(list_line[1]))
                #rs1
                output.write(register_num(list_line[2]))
                #immediate
                output.write("000000000000")
                #line jump (can be deleted)
                output.write("\n")

        #store
        if (line.find("str")!=-1):
            list_line=line.split()
            
            #r-i
            if(len(list_line)>3):
                #opcode
                output.write("0110")
                #rd
                output.write(register_num(list_line[1]))
                #rs1
                output.write(register_num(list_line[2]))
                #immediate
                binary_num=getbinary(int(list_line[3]), 12)
                output.write(str(binary_num))

                #line jump (can be deleted)
                output.write("\n")

            #r-r
            else:
                #opcode
                output.write("0110")
                #rd
                output.write(register_num(list_line[1]))
                #rs1
                output.write(register_num(list_line[2]))
                #immediate
                output.write("000000000000")
                #line jump (can be deleted)
                output.write("\n")


        #branch 
        if (line.find("br")!=-1):
            list_line=line.split()
            #opcode
            output.write("0111")
            #rb
            output.write(register_num(list_line[1]))
            #rs1
            output.write("0000")
            #rs2
            output.write("0000")
            #immediate
            output.write("00000000")

            #line jump (can be deleted)
            output.write("\n")

        #branch conditional
        if (line.find("bcnd")!=-1):
            list_line=line.split()
            #opcode
            output.write("1000")
            #rb
            output.write(register_num(list_line[1]))
            #rs1
            output.write(register_num(list_line[2]))
            #rs2
            output.write("0000")
            #immediate
            output.write("00000000")

            #line jump (can be deleted)
            output.write("\n")

    file1.close()
    output.close()

    #binary to decimal

    #input file 

    file1 = open("output_binary.rbf", 'r')
    count = 0

    #output file(name can be changed to compare binary vs decimal output)
    output = open("rom.mif", 'w')

    output.write("""WIDTH=24;
DEPTH=65536;

ADDRESS_RADIX=UNS;
DATA_RADIX=UNS;

CONTENT BEGIN\n""")

    #read every line
    while True:
        # Get next line from file
        line = file1.readline()

        # if line is empty
        # end of file is reached
        if not line:
           break

        #converts binary string to decimal
        decimal=int(line,2)

        #for space
        spaces="       :   "
        spaces=spaces[len(str(count)):]

        output.write("    "+str(count)+spaces+str(decimal)+";\n")
        count += 1

    output.write("    ["+str(count)+"..65535]  :   0;\n")
    output.write("END;")

interprete()










