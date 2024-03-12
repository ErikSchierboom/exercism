Class {
	#name : #RegularFrame,
	#superclass : #Frame,
	#instVars : [
		'firstRoll',
		'secondRoll'
	],
	#category : #'Exercise@Bowling'
}

{ #category : #'instance creation' }
RegularFrame class >> newWith: firstRoll and: secondRoll [
	self validRollsPair: firstRoll and: secondRoll.

	^ self new
		firstRoll: firstRoll;
		secondRoll: secondRoll;
		yourself
]

{ #category : #accessing }
RegularFrame >> firstRoll: pins [
	self validateRoll: pins.
	firstRoll := pins
]

{ #category : #scoring }
RegularFrame >> score [
	^ firstRoll + secondRoll
]

{ #category : #accessing }
RegularFrame >> secondRoll: pins [
	self validateRoll: pins.
	secondRoll := pins
]

{ #category : #'as yet unclassified' }
RegularFrame >> spareBonus [
	^ firstRoll
]

{ #category : #'as yet unclassified' }
RegularFrame >> strikeBonus [
	^ secondRoll
]
