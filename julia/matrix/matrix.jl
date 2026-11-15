using DelimitedFiles

function matrix(strmatrix)
    matrix = readdlm(IOBuffer(strmatrix), ' ', Int)
    collect(eachrow(matrix)), collect(eachcol(matrix))
end
