package series

import "core:strings"

Error :: enum {
	None,
	Invalid_Series_Length_Too_Large,
	Invalid_Series_Length_Zero,
	Invalid_Series_Length_Negative,
	Invalid_Sequence_Empty
}

series :: proc(sequence: string, series_len: int) -> ([]string, Error) {
	switch {
		case len(sequence) == 0:
			return nil, .Invalid_Sequence_Empty
		case series_len > len(sequence):
			return nil, .Invalid_Series_Length_Too_Large
		case series_len == 0:
			return nil, .Invalid_Series_Length_Zero
		case series_len < 0:
			return nil, .Invalid_Series_Length_Negative
	}

	series: = make([]string, len(sequence) - series_len + 1)
	for i in 0..<len(series) {
		part, _ := strings.substring(sequence, i, i + series_len)
		series[i] = part
	}

	return series, .None
}
