A1 = input("Ingrese el primer termino: ")
A2 = input("Ingrese el segundo termino de la secuencia: ")

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
for i in range (5):
    n = i + 1
    a.append(A1 + (n-1) * d)
    print(f'a({n})={a[i]}')       