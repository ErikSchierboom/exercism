Class {
	#name : #Diamond,
	#superclass : #Object,
	#category : #'Exercise@Diamond'
}

{ #category : #'as yet unclassified' }
Diamond >> rowsLetter: rowLetter [ 
	|letters lettersWithIndex|
	letters := Character alphabet asUppercase first: (Character alphabet asUppercase indexOf: (rowLetter first)).

	lettersWithIndex := (letters asArray withIndexCollect: [ :letter :i | letter -> i  ]) asOrderedCollection.
   lettersWithIndex addAll: lettersWithIndex reversed allButFirst.

	^ (lettersWithIndex collect: [ :letterWithIndex |
		|outerSpaces innerSpaces|
		outerSpaces := '' padLeftTo: (letters size - letterWithIndex value).
   	   innerSpaces := '' padLeftTo: ((letterWithIndex value - 1) * 2 - 1).
		letterWithIndex value = 1
			ifTrue: [ outerSpaces, letterWithIndex key asString, outerSpaces ]
			ifFalse: [ outerSpaces, letterWithIndex key asString, innerSpaces, letterWithIndex key asString, outerSpaces ]
	]) asArray 

]
