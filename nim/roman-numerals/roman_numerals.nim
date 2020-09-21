import tables

const romanNumeralValues = {
  1000:  "M",
   900: "CM",
   500:  "D",
   400: "CD",
   100:  "C",
    90: "XC",
    50:  "L",
    40: "XL",
    10:  "X",
     9: "IX",
     5:  "V",
     4: "IV",
     1:  "I",
}.toOrderedTable

proc roman*(n: int): string =
  var remainder = n

  for threshold, numeral in romanNumeralValues:
      while remainder div threshold > 0:
        result.add(numeral)        
        remainder.dec threshold
