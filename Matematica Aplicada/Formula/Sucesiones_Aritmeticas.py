A1 = input("Ingrese el primer termino: ")
A2 = input("Ingrese el segundo termino de la secuencia: ")
r = int(input("Ingrese la cantidad de numeros: "))

try:
    A1 = int(A1)
    A2 = int(A2)
    d = A2 - A1

except ValueError:
    A1 = float(A1)
    A2 = float(A2)
    d = A2 - A1
    d = float("{:.2f}".format(d))

a = []
for i in range(r):
    n = i + 1
    a.append(A1+(n-1)*d)
    print(f'a({n})={a[i]}')
    
print(f"La formula es {d}(n-1)+{A1}")
num1 = int(input("Desde que numero deseas hacer la sumatoria: ")) - 1
num2 = int(input("Hasta que numero: ")) - 1

suma = sum(a[num1:num2])
print(suma)