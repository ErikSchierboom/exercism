function sortquantity!(qty)
    indices = sortperm(qty; rev=true)
    sort!(qty; rev=true)
    indices
end

sortcustomer(cust, srtperm) = cust[srtperm]

function production_schedule!(cust, qty)
    indices = sortquantity!(qty)
    cust[indices], invperm(indices)
end
