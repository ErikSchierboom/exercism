Class {
	#name : #StrikeFrame,
	#superclass : #Frame,
	#category : #'Exercise@Bowling'
}

{ #category : #scoring }
StrikeFrame >> score [
	^ 10 + nextFrame spareBonus + nextFrame strikeBonus
]

{ #category : #'as yet unclassified' }
StrikeFrame >> spareBonus [
	^ 10
]

{ #category : #'as yet unclassified' }
StrikeFrame >> strikeBonus [
	^ nextFrame spareBonus
]
