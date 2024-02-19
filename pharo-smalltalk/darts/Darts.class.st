Class {
	#name : #Darts,
	#superclass : #Object,
	#category : #'Exercise@Darts'
}

{ #category : #'as yet unclassified' }
Darts >> scoreX: xPos y: yPos [ 
	|distance|
	distance := (xPos squared + yPos squared) sqrt.
	distance <= 1 ifTrue: [ ^ 10 ].
	distance <= 5 ifTrue: [ ^ 5 ].
	distance <= 10 ifTrue: [ ^ 1 ].
	^ 0
]
