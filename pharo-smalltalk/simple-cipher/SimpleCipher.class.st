Class {
	#name : #SimpleCipher,
	#superclass : #Object,
	#instVars : [
		'key'
	],
	#category : #'Exercise@SimpleCipher'
}

{ #category : #'as yet unclassified' }
SimpleCipher class >> generateKey [
	^ (1 to: 100) collect: [ :n | Character alphabet atRandom ] as: String
]

{ #category : #converting }
SimpleCipher >> decode: plaintext [
	^ self shift: plaintext using: #-
]

{ #category : #converting }
SimpleCipher >> encode: plaintext [
	^ self shift: plaintext using: #+
]

{ #category : #initialization }
SimpleCipher >> initialize [
	key := self class generateKey 
]

{ #category : #accessing }
SimpleCipher >> key [
	^ key
]

{ #category : #accessing }
SimpleCipher >> key: aString [ 
	key := aString
]

{ #category : #'as yet unclassified' }
SimpleCipher >> shift: plaintext using: op [
	^ (plaintext asArray withIndexCollect: [ :c :i |
		|alphabetIdx keyIdx|
		alphabetIdx := Character alphabet indexOf: c.
		keyIdx := Character alphabet indexOf: (key atWrap: i).
		Character alphabet atWrap: (alphabetIdx perform: op with: (keyIdx - 1))
	]) as:String.
]
