package letter

// FreqMap records the frequency of each rune in a given text.
type FreqMap map[rune]int

// Frequency counts the frequency of each rune in a given text and returns this
// data as a FreqMap.
func Frequency(s string) FreqMap {
	m := FreqMap{}
	for _, r := range s {
		m[r]++
	}
	return m
}

// ConcurrentFrequency counts the frequency of each rune in the given strings,
// by making use of concurrency.
func ConcurrentFrequency(l []string) FreqMap {
	res := make(FreqMap)
	ch := make(chan FreqMap, 10)

	for _, text := range l {
		go func(s string) {
			ch <- Frequency(s)
		}(text)
	}

	for i := 0; i < len(l); i++ {
		for r, freq := range <-ch {
			res[r] += freq
		}
	}

	return res
}
