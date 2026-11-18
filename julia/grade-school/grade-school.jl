new_school() = Dict{Int,Vector{String}}()

function add!(students, school)
    map(students) do student
        if student.name ∈ roster(school)
            return false
        end

        students_in_grade = get!(school, student.grade, [])
        push!(students_in_grade, student.name)
        sort!(students_in_grade)
        true
    end
end

grade(num, school) = get(school, num, [])

roster(school) = [student
                  for num in sort(keys(school))
                  for student in school[num]]
