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

num1 = int(input("Desde que numero deseas hacer la sumatoria: ")) - 1
num2 = int(input("Hasta que numero: "))
suma = sum(a[num1:num2])
print(suma)