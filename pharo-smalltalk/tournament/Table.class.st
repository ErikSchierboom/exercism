Class {
	#name : #Table,
	#superclass : #Object,
	#instVars : [
		'rows'
	],
	#category : #'Exercise@Tournament'
}

{ #category : #'as yet unclassified' }
Table class >> withTeams: teams [
	teams sort: [ :a :b | a points > b points or: [ a points = b points and: [ a name <= b name ] ] ].
	^ teams inject: self new into: [ :table :team | table addTeam: team ]
]

{ #category : #adding }
Table >> addTeam: team [
	rows add: ((OrderedCollection new)
		add: team name;
		add: team played asString;
		add: team wins asString;
		add: team draws asString;
		add: team losses asString;
		add: team points asString;
		yourself)
]

{ #category : #adding }
Table >> asArray [ 
	^ (rows collect: [ :row |
		'{1} | {2} | {3} | {4} | {5} | {6}' format: { 
			(row at: 1) padRightTo: 30.
			(row at: 2) padLeftTo: 2.
			(row at: 3) padLeftTo: 2.
			(row at: 4) padLeftTo: 2.
			(row at: 5) padLeftTo: 2.
			(row at: 6) padLeftTo: 2
		}
	]) asArray
	
		
]

{ #category : #adding }
Table >> initialize [ 
	rows := OrderedCollection new.
	rows add: #('Team' 'MP' 'W' 'D' 'L' 'P')
]
