Class {
	#name : #Grains,
	#superclass : #Object,
	#category : #'Exercise@Grains'
}

{ #category : #accessing }
Grains >> atSquare: anInteger [ 
   (anInteger between: 1 and: 64) ifFalse: [ Error signal: 'square must be between 1 and 64' ].
	^ 2 raisedTo: anInteger -1
]

{ #category : #accessing }
Grains >> total [
	^ (2 raisedTo: 64) - 1
]
