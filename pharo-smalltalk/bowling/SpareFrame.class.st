Class {
	#name : #SpareFrame,
	#superclass : #Frame,
	#instVars : [
		'firstRoll',
		'secondRoll'
	],
	#category : #'Exercise@Bowling'
}

{ #category : #'instance creation' }
SpareFrame class >> newWith: firstRoll and: secondRoll [
	self validRollsPair: firstRoll and: secondRoll.

	^ self new
		firstRoll: firstRoll;
		secondRoll: secondRoll;
		yourself
]

{ #category : #accessing }
SpareFrame >> firstRoll: pins [
	self validateRoll: pins.
	firstRoll := pins
]

{ #category : #scoring }
SpareFrame >> score [
	^ firstRoll + secondRoll + nextFrame spareBonus
]

{ #category : #accessing }
SpareFrame >> secondRoll: pins [
	self validateRoll: pins.
	secondRoll := pins
]

{ #category : #'as yet unclassified' }
SpareFrame >> spareBonus [
	^ firstRoll
]

{ #category : #'as yet unclassified' }
SpareFrame >> strikeBonus [
	^ secondRoll
]
