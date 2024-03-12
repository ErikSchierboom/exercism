Class {
	#name : #Team,
	#superclass : #Object,
	#instVars : [
		'name',
		'wins',
		'losses',
		'draws'
	],
	#category : #'Exercise@Tournament'
}

{ #category : #'as yet unclassified' }
Team class >> withName: aName [
	|team|
	team := self new.
	team name: aName.
	^ team
	
]

{ #category : #initialization }
Team >> addDraw [
	draws := draws + 1
]

{ #category : #initialization }
Team >> addLoss [
	losses := losses + 1
]

{ #category : #initialization }
Team >> addWin [
	wins := wins + 1
]

{ #category : #initialization }
Team >> draws [
	^ draws
]

{ #category : #initialization }
Team >> initialize [
	wins := 0.
	draws := 0.
	losses := 0
]

{ #category : #initialization }
Team >> losses [
	^ losses
]

{ #category : #accessing }
Team >> name [
	^ name
]

{ #category : #accessing }
Team >> name: aString [ 
	name := aString
]

{ #category : #initialization }
Team >> played [
	^ wins + draws + losses
]

{ #category : #initialization }
Team >> points [
	^ wins * 3 + draws
]

{ #category : #initialization }
Team >> wins [
	^ wins
]
