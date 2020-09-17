import algorithm, sequtils

type
  Student = tuple[name: string, grade: int]

  School* = object
    students*: seq[Student]

proc roster*(school: School): seq[string] =
  school.students.sortedByIt((it.grade, it.name)).mapIt(it.name)

proc grade*(school: School, grade: int): seq[string] =
  school.students.filterIt(it.grade == grade).mapIt(it.name).sorted
