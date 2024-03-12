Class {
	#name : #Die,
	#superclass : #Object,
	#instVars : [
		'faces'
	],
	#category : #'Exercise@Die'
}

{ #category : #'as yet unclassified' }
Die class >> withFaces: faces [ 
	^ Die new faces: faces
]

{ #category : #accessing }
Die >> faces [
	^ faces
]

{ #category : #accessing }
Die >> faces: newFaces [ 
	faces := newFaces
]

{ #category : #initialization }
Die >> initialize [			
	faces := 6
]

{ #category : #'as yet unclassified' }
Die >> roll [
	^ faces atRandom
]
