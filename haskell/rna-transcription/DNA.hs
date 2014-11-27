module DNA (toRNA) where

toRNA :: String -> String
toRNA = map transcribeNucleotide
	where transcribeNucleotide nucleotide = case nucleotide of 
		'C' -> 'G'
		'G' -> 'C'
		'A' -> 'U'
		'T' -> 'A'
		_ -> error "Invalid DNA string"