Class {
	#name : #Isogram,
	#superclass : #Object,
	#category : #'Exercise@Isogram'
}

{ #category : #testing }
Isogram >> isIsogramPhrase: aString [
	|letters|
	letters := aString onlyLetters asLowercase.
   ^ letters asSet size = letters size.
]
