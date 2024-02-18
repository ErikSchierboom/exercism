Class {
	#name : #RomanNumerals,
	#superclass : #Object,
	#category : #'Exercise@RomanNumerals'
}

{ #category : #'accessing - dictionary access' }
RomanNumerals class >> numerals [
	^ {  
    1000 ->  'M'.
     900 -> 'CM'.
     500 ->  'D'.
     400 -> 'CD'.
     100 ->  'C'.
      90 -> 'XC'.
      50 ->  'L'.
      40 -> 'XL'.
      10 ->  'X'.
       9 -> 'IX'.
       5 ->  'V'.
       4 -> 'IV'.
       1 ->  'I'
    } asOrderedDictionary
]

{ #category : #converting }
RomanNumerals >> romanNumber: anInteger [ 
    |remainder|
    remainder := anInteger.
	 ^ String streamContents: [ :out |
	       self class numerals keysAndValuesDo: [ :value :numeral | 
		        [value <= remainder] whileTrue: [ 
			         remainder := remainder - value.
		            out << numeral
		        ]
	        ]
      ]
]
