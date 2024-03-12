Class {
	#name : #AtbashCipher,
	#superclass : #Object,
	#category : #'Exercise@AtbashCipher'
}

{ #category : #'as yet unclassified' }
AtbashCipher class >> mapping [
	^ Dictionary 
		  newFromKeys: (Character alphabet asOrderedCollection addAll: ($0 to: $9); yourself)
		  andValues: (Character alphabet reversed asOrderedCollection addAll: ($0 to: $9); yourself)
]

{ #category : #'as yet unclassified' }
AtbashCipher >> decodePhrase: ciphertext [ 
	^ self shift: ciphertext
]

{ #category : #'as yet unclassified' }
AtbashCipher >> encodePhrase: plaintext [ 
	^ ((self shift: plaintext asLowercase) allRegexMatches: '.{1,5}') joinUsing: ' '
]

{ #category : #'as yet unclassified' }
AtbashCipher >> shift: text [
	^ text select: #isAlphaNumeric thenCollect: [ :c | self class mapping at: c ]
]
