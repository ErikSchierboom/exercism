Class {
	#name : #IsbnVerifier,
	#superclass : #Object,
	#category : #'Exercise@IsbnVerifier'
}

{ #category : #testing }
IsbnVerifier >> isValidIsbn: aString [
    |normalized checksum|
    checksum := 0.
    normalized := aString reject: [ :c | c = $- ].
	 (normalized matchesRegex: '^\d{9}[\dX]$') ifFalse: [ ^ false ].
	 normalized reversed withIndexDo: [ :c :i |
		checksum := checksum + ((c isDigit ifTrue: [ c digitValue ] ifFalse: [ 10 ]) * i)
	 ].
    ^ checksum isDivisibleBy: 11
	
]
