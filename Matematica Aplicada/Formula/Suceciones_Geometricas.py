import math

A1 = input("Ingrese el primer termino: ")
A2 = input("Ingrese el segundo termino de la secuencia: ")
rango = int(input("Ingrese la cantidad de numeros: "))

try:
    A1 = int(A1)
    A2 = int(A2)
    r = A2 / A1

except ValueError:
    A1 = float(A1)
    A2 = float(A2)
    r = A2 / A1

a = []
for i in range(rango):
    n = i + 1
    a.append(A1*r**(n-1))
    print(f'a({n})={a[i]}')


print(f"La razon geometrica es: {r}")
print(f"La formula es {A1}*{r}**(n-1)")
valor = input("Ingrese el termino: ")
try:
    x = int(valor) / A1
except ValueError:
    x = float(valor) / A1  

ax = round(math.log(x, r)) + 1
print(f"El termino de lugar {ax} es {valor}")
print(f"a({ax})={valor}")

#forma
#n = 0
#termino = 0
#vfinal = input("Ingrese el termino: ")
#try:
#    vfinal = int(vfinal)
#except ValueError:
#    vfinal = float(vfinal)
#
#dif=vfinal-termino
#
#while dif > 0:
#    n=n+1
#    termino = A1*r**(n-1)
#    dif=vfinal-termino
#    anterior =A1*r**(n-2)
#print (f'El termino de lugar {n} es {termino}')
#print (f'El termino de lugar {n-1} es {anterior}')