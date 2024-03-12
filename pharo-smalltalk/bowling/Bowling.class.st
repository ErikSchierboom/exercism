Class {
	#name : #Bowling,
	#superclass : #Object,
	#instVars : [
		'frames'
	],
	#category : #'Exercise@Bowling'
}

{ #category : #'as yet unclassified' }
Bowling >> framesFromRolls: rolls [
	|remaining|
	remaining := Stack new.
	rolls reverseDo: [ :roll | remaining push: roll ].
	Transcript show: remaining; cr.
	[ remaining isNotEmpty ] whileTrue: [ 
		frames size = 9 
			ifTrue: [
				Transcript show: 'final frame'; cr; show: remaining; cr.
				frames add: (FinalFrame newWith: remaining asOrderedCollection).
				remaining removeAll	
			]
			ifFalse: [
				|firstRoll secondRoll|
				firstRoll := remaining pop.
				Transcript show: remaining; cr.
				firstRoll = 10 
					ifTrue: [ frames add: (StrikeFrame new) ]
				   ifFalse: [ 
					  secondRoll := remaining pop.
					  firstRoll + secondRoll = 10
						  ifTrue: [ frames add: (SpareFrame newWith: firstRoll and: secondRoll ) ]
						  ifFalse: [ frames add: (RegularFrame newWith: firstRoll and: secondRoll ) ]
					]
			].
		frames size > 1 ifTrue: [ 
			(frames at: (frames size - 1)) nextFrame: frames last
		]
	]
]

{ #category : #initialization }
Bowling >> initialize [
	frames := OrderedCollection new: 10.

]

{ #category : #'as yet unclassified' }
Bowling >> scoreAfterRolling: rolls [
	(rolls anySatisfy: #negative) ifTrue: [ self error: 'Negative roll is invalid' ].
	(rolls anySatisfy: [ :roll | roll > 10 ]) ifTrue: [ self error: 'Pin count exceeds pins on the lane' ].	
	
	self framesFromRolls: rolls.
	frames size < 10 ifTrue: [ self error: 'Score cannot be taken until the end of the game' ].
	^ frames sum: #score
]

{ #category : #'as yet unclassified' }
Bowling >> scoreRolling: pins after: precedingRolls [
	^ self scoreAfterRolling: precedingRolls, { pins }
	
	
]
