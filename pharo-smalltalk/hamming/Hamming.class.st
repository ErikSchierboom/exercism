Class {
	#name : #Hamming,
	#superclass : #Object,
	#category : #'Exercise@Hamming'
}

{ #category : #'as yet unclassified' }
Hamming >> distanceStrand1: left strand2: right [ 
	left size = right size ifFalse: [ 
		left isEmpty ifTrue: [ Error signal: 'left strand must not be empty' ].
      right isEmpty ifTrue: [ Error signal: 'right strand must not be empty' ].
		Error signal: 'left and right strands must be of equal length'
	].
	^ (left asArray with: right asArray collect: [ :a :b | (a ~= b) asInteger ]) sumNumbers
]
