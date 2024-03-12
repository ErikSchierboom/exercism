Class {
	#name : #FinalFrame,
	#superclass : #Frame,
	#instVars : [
		'rolls'
	],
	#category : #'Exercise@Bowling'
}

{ #category : #'instance creation' }
FinalFrame class >> newWith: rolls [
	self validateRolls: rolls.
	^ self new
		rolls: rolls;
		yourself
]

{ #category : #'as yet unclassified' }
FinalFrame class >> validateRolls: rolls [
	rolls size > 3 ifTrue: [ self error: 'Cannot roll after game is over' ].
	rolls first = 10
		ifTrue: [ 
			rolls size < 3 ifTrue: [ self error: 'Score cannot be taken until the end of the game' ].
			(rolls at: 2) < 10 ifTrue: [ self validRollsPair: (rolls at: 2) and: (rolls at: 3) ]
		] 
		ifFalse: [
			self validRollsPair: (rolls at: 1) and: (rolls at: 2).
			
			(rolls at: 1) + (rolls at: 2) = 10
				ifTrue: [ rolls size < 3 ifTrue: [ self error: 'Score cannot be taken until the end of the game' ] ]
				ifFalse: [ rolls size > 2 ifTrue: [ self error: 'Cannot roll after game is over' ] ]
		].
	
]

{ #category : #accessing }
FinalFrame >> rolls: pins [
	pins do: [ :roll | self validateRoll: roll ].
	rolls := pins
]

{ #category : #scoring }
FinalFrame >> score [
	^ rolls sum

	
]

{ #category : #'as yet unclassified' }
FinalFrame >> spareBonus [
	^ rolls first
]

{ #category : #'as yet unclassified' }
FinalFrame >> strikeBonus [
	^ (rolls at: 2)
]
