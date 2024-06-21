def horner_method(coefficients, x, p):
    result = 0
    for coefficient in reversed(coefficients):
        result = (result * x + coefficient) % p
    return result


def lagrange_polynomial(points, x, p):
    def mod_inverse(a, p):
        return pow(a, p - 2, p)

    result = 0
    for i, (xi, yi) in enumerate(points):
        li = 1
        for j, (xj, _) in enumerate(points):
            if i != j:
                li = li * (x - xj) * mod_inverse(xi - xj, p) % p
        result = (result + yi * li) % p
    return result


p = 13
x = 4
coefficients = [1, 2, 3, 4, 2, 1]
print(horner_method(coefficients, x, p))

p = 17
x = 14
points = [(0, 2), (1, 4), (2, 1), (6, 2)]
print(lagrange_polynomial(points, x, p))
