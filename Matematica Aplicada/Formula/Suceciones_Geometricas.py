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
print(f"La formula es {A1} * {r} ** (n-1)")
