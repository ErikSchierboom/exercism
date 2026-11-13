z(x, y) = complex(x, y)

euler(r, θ) = r * cis(θ)

rotate(x, y, θ) = reim(complex(x, y) * cis(θ))

function rdisplace(x, y, r)
    d = sqrt(x^2 + y^2)
    return (x * (d + r) / d, y * (d + r) / d)
end

function findsong(x, y, r, θ)
    x1, y1 = rdisplace(x, y, r)
    x2, y2 = rotate(x1, y1, θ)
    return (x2, y2)
end
