using LinearAlgebra

function orientrobot(vecs)
    reshape([normalize(vecs[1]); normalize(vecs[2]); normalize(vecs[3])], 2, 3)
end

function rotaterobot(orientation, θ)
    [cos(θ) -sin(θ); sin(θ) cos(θ)] * orientation
end

function robotoriented(orientation, direction)
    isapprox(normalize(direction), orientation[:, 2])
end

function bodylocation(orientation, position)
    orientation .+ position
end
