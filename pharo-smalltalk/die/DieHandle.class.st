Class {
	#name : #DieHandle,
	#superclass : #Object,
	#instVars : [
		'dice'
	],
	#category : #'Exercise@Die'
}

{ #category : #'as yet unclassified' }
DieHandle class >> withFaces: faces amount: amount [ 
	^ (1 to: amount) inject: self new into: [ :handle :n | handle addDie: (Die withFaces: faces) ] 
]

{ #category : #arithmetic }
DieHandle >> + aDieHandle [ 
	aDieHandle dice do: [ :die | self addDie: die ]
]

{ #category : #adding }
DieHandle >> addDie: aDie [ 
	dice add: aDie
]

{ #category : #accessing }
DieHandle >> dice [
	^ dice
]

{ #category : #'as yet unclassified' }
DieHandle >> diceNumber [
	^ dice size 
]

{ #category : #initialization }
DieHandle >> initialize [			
	dice := OrderedCollection new
]

{ #category : #'as yet unclassified' }
DieHandle >> roll [
	^ dice sum: #roll
]
