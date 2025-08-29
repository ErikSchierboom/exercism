import "lib/github.com/diku-dk/sorts/merge_sort"

def scores = id

def latest = last

def personal_best = i32.maximum

def personal_top_three (values: []i32): [3]i32 = 
  values
  |> merge_sort (>) 
  |> take 3
