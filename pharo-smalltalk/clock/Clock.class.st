Class {
	#name : #Clock,
	#superclass : #Object,
	#instVars : [
		'minutes'
	],
	#category : #'Exercise@Clock'
}

{ #category : #'as yet unclassified' }
Clock class >> hour: hours minute: minutes [
	|clock|
	clock := self new.
	clock minutes: (hours * 60) + minutes.
	^ clock
]

{ #category : #arithmetic }
Clock >> + value [
	self minutes: minutes + value
]

{ #category : #arithmetic }
Clock >> - value [ 
	self minutes: minutes - value
]

{ #category : #comparing }
Clock >> = other [
	 ^ minutes = other minutes
]

{ #category : #converting }
Clock >> asString [
	^ (minutes // 60) asTwoCharacterString, ':', (minutes \\ 60) asTwoCharacterString
]

{ #category : #accessing }
Clock >> minutes [
	^ minutes
]

{ #category : #accessing }
Clock >> minutes: value [ 
	minutes := value \\ 1440
]
