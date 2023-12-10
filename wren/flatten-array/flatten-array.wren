class Flatten {
  static flatten(list) {
    if (list is Num) return [list]
    if (list is Sequence) return list.map {|l| flatten(l) }.reduce([]) { |acc, elem| acc + elem }

    return []
  }
}