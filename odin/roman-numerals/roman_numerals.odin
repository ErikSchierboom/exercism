package roman_numerals

import "core:strings"

NumeralThreshold :: struct {
	numeral: string,
	threshold: int,
}

numeral_thresholds := [?]NumeralThreshold{	
	NumeralThreshold{"M", 1000},
	NumeralThreshold{"CM", 900},
	NumeralThreshold{"D", 500},
	NumeralThreshold{"CD", 400},
	NumeralThreshold{"C", 100},
	NumeralThreshold{"XC", 90},
	NumeralThreshold{"L", 50},
	NumeralThreshold{"XL", 40},
	NumeralThreshold{"X", 10},
	NumeralThreshold{"IX", 9},
	NumeralThreshold{"V", 5},
	NumeralThreshold{"IV", 4},
	NumeralThreshold{"I", 1}
}

to_roman_numeral :: proc(decimal: int) -> string {
	numerals := strings.builder_make()
	remainder := decimal

	for numeral_threshold in numeral_thresholds {
		for remainder / numeral_threshold.threshold > 0 {
			remainder -= numeral_threshold.threshold
			strings.write_string(&numerals, numeral_threshold.numeral)
		}
	}

	return strings.to_string(numerals)
}
