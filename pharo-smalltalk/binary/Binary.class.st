Class {
	#name : #Binary,
	#superclass : #Object,
	#category : #'Exercise@Binary'
}

{ #category : #'as yet unclassified' }
Binary >> decimalFromBinary: aString [ 
	^ aString asArray inject: 0 into: 
		[ :acc :c | 	(c between: $0 and: $1)
				          ifTrue: [ acc * 2 + (c = $1) asInteger ]
				          ifFalse: [ ^ nil ] ].
]
