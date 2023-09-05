function agm(a, b; tol = 1.0e-15)
    a0 = a; b0 = b
    while abs(b0-a0) >= tol
        a0, b0 = (a0 + b0)/2.0, sqrt(a0 * b0)
    end
    return (a0 + b0) / 2.0
end
