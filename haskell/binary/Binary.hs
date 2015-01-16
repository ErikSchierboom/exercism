module Binary (toDecimal) where

toDecimal :: String -> Int
toDecimal digits = parseDigits digits 0

parseDigits :: String -> Int -> Int
parseDigits "" value = value
parseDigits (digit:remainder) value =
    value `seq`
    case digit of
		'0' -> parseDigits remainder (value * 2)
		'1' -> parseDigits remainder (value * 2 + 1)
		_   -> 0