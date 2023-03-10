function badge(id, name, department)
    department = isnothing(department) ? "OWNER" : uppercase(department)

    if isnothing(id)
        "$name - $department"
    else
        "[$id] - $name - $department"
    end
end