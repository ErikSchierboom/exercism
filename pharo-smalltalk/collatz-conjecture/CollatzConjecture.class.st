Class {
	#name : #CollatzConjecture,
	#superclass : #Object,
	#category : #'Exercise@CollatzConjecture'
}

{ #category : #accessing }
CollatzConjecture >> stepsFrom: anInteger [
	| current steps |	
	anInteger < 1 ifTrue: [ Error signal: 'Only positive numbers are allowed' ].	
	current := anInteger.
	steps := 0.
	[ current ~= 1 ] whileTrue: [ 
		current := current even
			           ifTrue: [ current // 2 ]
			           ifFalse: [ current * 3 + 1 ].
		steps := steps + 1 ].
	^ steps
]
