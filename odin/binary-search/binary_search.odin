package binary_search

find :: proc(haystack: []$T, needle: T) -> (index: int, found: bool) #optional_ok {
	left := 0
	right := len(haystack) - 1

	for left <= right {
		middle := (left + right) / 2
		
		switch {
			case needle < haystack[middle]: right = middle - 1
			case needle > haystack[middle]: left = middle + 1
			case: return middle, true
		}
	}

	return 0, false
}
