Class {
	#name : #Minefield,
	#superclass : #Object,
	#instVars : [
		'rows',
		'cols',
		'neighborDeltas',
		'cells'
	],
	#classInstVars : [
		'rows',
		'cols',
		'coords',
		'mines'
	],
	#category : #'Exercise@Minesweeper'
}

{ #category : #accessing }
Minefield >> cols [
	^ cols
]

{ #category : #'instance creation' }
Minefield >> fromLines: lines [
	rows := lines size.
	cols := lines ifEmpty: [ 0 ] ifNotEmpty: [ lines first size ].
	cells := OrderedDictionary new.
	lines withIndexDo: [ :line :row |
		line withIndexDo: [ :c :col | cells at: col@row put: c	] ]
]

{ #category : #initialization }
Minefield >> initialize [
	neighborDeltas := (OrderedCollection new)
		add: -1@0; add: -1@(-1); add: -1@1; add: 0@(-1); add: 0@1; add: 1@0; add: 1@(-1); add: 1@1;
		yourself
]

{ #category : #testing }
Minefield >> isMine: coord [
	^ (cells at: coord) = $*
]

{ #category : #'as yet unclassified' }
Minefield >> neighboringMines: coord [
	^ neighborDeltas count: [ :delta | (cells at: (coord + delta) ifAbsent: [ $  ]) = $* ]
]

{ #category : #accessing }
Minefield >> rows [
	^ rows
]
