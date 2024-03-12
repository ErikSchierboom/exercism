Class {
	#name : #RobotSimulator,
	#superclass : #Object,
	#instVars : [
		'direction',
		'position',
		'actions',
		'directions',
		'advances'
	],
	#category : #'Exercise@RobotSimulator'
}

{ #category : #'as yet unclassified' }
RobotSimulator >> advance [
	position := position + (advances at: direction)
]

{ #category : #converting }
RobotSimulator >> asDictionary [
	^ ((Dictionary new)
		add: 'direction'->direction;
		add: 'position'->
			((Dictionary new)
				add: 'x'->position x;
				add: 'y'->position y;
				yourself);
		yourself)
]

{ #category : #initialization }
RobotSimulator >> initialize [
	actions := (Dictionary new)
		add: $A->[ self advance ];
		add: $L->[ self turnLeft ];
		add: $R->[ self turnRight ];
		yourself.
	
	directions := #('north' 'east' 'south' 'west').

	advances := (Dictionary new)
		add: 'north'->(0@1);
		add: 'east'->(1@0);
		add: 'south'->(0@(-1));
		add: 'west'->((-1)@0);
		yourself
	
]

{ #category : #'as yet unclassified' }
RobotSimulator >> sendInstructions: instructions [ 
	instructions do: [ :instruction | (actions at: instruction) value ].
	^ self asDictionary
]

{ #category : #'as yet unclassified' }
RobotSimulator >> startFacing: startDirection atPosition: startPosition [ 
	direction := startDirection.
	position := (startPosition at: 'x') @ (startPosition at: 'y').
	^ self asDictionary
]

{ #category : #'as yet unclassified' }
RobotSimulator >> turnLeft [
	direction := directions atWrap: ((directions indexOf: direction) - 1)
]

{ #category : #'as yet unclassified' }
RobotSimulator >> turnRight [
	direction := directions atWrap: ((directions indexOf: direction) + 1)
]
