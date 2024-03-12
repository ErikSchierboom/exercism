Class {
	#name : #Minesweeper,
	#superclass : #Object,
	#category : #'Exercise@Minesweeper'
}

{ #category : #'as yet unclassified' }
Minesweeper >> annotateMinefield: lines [
	|minefield|
	minefield := Minefield new fromLines: lines.
	
	^ (1 to: minefield rows) collect: [ :row |
		((1 to: minefield cols) collect: [ :col |
			|coord mines|
			coord := col@row.
			(minefield isMine: coord)
				ifTrue: [ $* ]
				ifFalse: [
					mines := minefield neighboringMines: coord.
					mines isZero ifTrue: [ $  ] ifFalse: [ mines asCharacterDigit  ]
				]
		]) joinUsing: ''
	]
]
