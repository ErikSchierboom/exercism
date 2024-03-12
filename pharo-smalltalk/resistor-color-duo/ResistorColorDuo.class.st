Class {
	#name : #ResistorColorDuo,
	#superclass : #Object,
	#category : #'Exercise@ResistorColorDuo'
}

{ #category : #accessing }
ResistorColorDuo class >> colors [
	^ #('black' 'brown' 'red' 'orange' 'yellow' 'green' 'blue' 'violet' 'grey' 'white')
]

{ #category : #'as yet unclassified' }
ResistorColorDuo >> valueWithColor: value [
	^ (self class colors indexOf: value ifAbsent: [ self error: 'Invalid color' ]) - 1
]

{ #category : #'as yet unclassified' }
ResistorColorDuo >> valueWithColors: values [ 
	^ ((self valueWithColor: (values at: 1)) * 10) + (self valueWithColor: (values at: 2))
]
