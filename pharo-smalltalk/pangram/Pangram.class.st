Class {
	#name : #Pangram,
	#superclass : #Object,
	#category : #'Exercise@Pangram'
}

{ #category : #testing }
Pangram >> isPangramSentence: aString [ 
	^ (Character alphabet difference: aString asLowercase) isEmpty
]
