Class {
	#name : #CollatzConjecture,
	#superclass : #Object,
	#category : #'Exercise@CollatzConjecture'
}

{ #category : #accessing }
CollatzConjecture >> stepsFrom: anInteger [
	anInteger < 1 ifTrue: [ Error signal: 'Only positive numbers are allowed' ].	
	^ self stepsFrom: anInteger steps: 0
]

{ #category : #'as yet unclassified' }
CollatzConjecture >> stepsFrom: anInteger steps: count [ 
	anInteger = 1 ifTrue: [ ^ count ].
	^ anInteger odd
		ifTrue: [ self stepsFrom: anInteger * 3 + 1 steps: count + 1 ]
		ifFalse: [ self stepsFrom: anInteger / 2 steps: count + 1 ].
]
