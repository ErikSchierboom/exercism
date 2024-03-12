Class {
	#name : #Luhn,
	#superclass : #Object,
	#category : #'Exercise@Luhn'
}

{ #category : #'as yet unclassified' }
Luhn >> validValue: aString [
	|checksum digit numDigits|
	checksum := 0.
	numDigits := 0.
	(aString reject: #isSeparator) reversed withIndexDo: [ :c :i |
		c isDigit ifFalse: [ ^ false ].
		
		digit := c digitValue.
		i even ifTrue: [ digit := digit * 2 ].
		digit > 9 ifTrue: [ digit := digit - 9 ].
		
		checksum := checksum + digit digitSum.
		numDigits := numDigits + 1.
   ].
	^ numDigits > 1 and: [ checksum isDivisibleBy: 10 ]
]
