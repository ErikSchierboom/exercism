Class {
	#name : #Frame,
	#superclass : #Object,
	#instVars : [
		'nextFrame'
	],
	#category : #'Exercise@Bowling'
}

{ #category : #'as yet unclassified' }
Frame class >> validRollsPair: firstRoll and: secondRoll [
	firstRoll + secondRoll > 10 ifTrue: [ self error: 'Pin count exceeds pins on the lane' ].
]

{ #category : #accessing }
Frame >> nextFrame [
	^ nextFrame
]

{ #category : #accessing }
Frame >> nextFrame: frame [
	nextFrame := frame
]

{ #category : #'as yet unclassified' }
Frame >> spareBonus [
	^ 0
]

{ #category : #'as yet unclassified' }
Frame >> strikeBonus [
	^ 0
]

{ #category : #'as yet unclassified' }
Frame >> validateRoll: pins [
	pins negative ifTrue: [ self error: 'Negative roll is invalid' ].
	pins > 10 ifTrue: [ self error: 'Pin count exceeds pins on the lane' ].
]
