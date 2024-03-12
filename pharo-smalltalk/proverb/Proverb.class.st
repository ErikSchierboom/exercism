Class {
	#name : #Proverb,
	#superclass : #Object,
	#category : #'Exercise@Proverb'
}

{ #category : #'as yet unclassified' }
Proverb >> reciteStrings: subjects [
	|lines|
	subjects isEmpty ifTrue: [ ^ #() ].	
	lines := OrderedCollection new: subjects size.
	self withPairs: subjects do: [ :l :r | lines add: 'For want of a ', l, ' the ', r, ' was lost.' ].
	lines add: 'And all for the want of a ', subjects first, '.'.
	^ lines asArray 
]

{ #category : #'as yet unclassified' }
Proverb >> withPairs: aCollection do: aBlock [
	^ aCollection allButLast with: aCollection allButFirst do: [ :a :b | aBlock value: a value: b ]
]
