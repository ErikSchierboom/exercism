Class {
	#name : #Tournament,
	#superclass : #Object,
	#category : #'Exercise@Tournament'
}

{ #category : #converting }
Tournament >> asTable: teams [
	^ (Table withTeams: teams values) asArray
]

{ #category : #converting }
Tournament >> asTeams: scores [
	|teams|	
	teams := Dictionary new.	
	scores do: [ :score |
		|parts team1 team2 outcome|
		parts := score substrings: ';'.
		team1 := teams at: (parts at: 1) ifAbsentPut: [ Team withName: (parts at: 1) ].
		team2 := teams at: (parts at: 2) ifAbsentPut: [ Team withName: (parts at: 2) ].
		outcome := parts at: 3.
		outcome = 'win' ifTrue: [ team1 addWin. team2 addLoss ].
		outcome = 'draw' ifTrue: [ team1 addDraw. team2 addDraw ].
		outcome = 'loss' ifTrue: [ team1 addLoss. team2 addWin ].
	].
	^ teams
]

{ #category : #'as yet unclassified' }
Tournament >> tallyRows: results [ 	
	^ self asTable: (self asTeams: results)
	
	
]
