Class {
	#name : #Raindrops,
	#superclass : #Object,
	#category : #'Exercise@Raindrops'
}

{ #category : #'as yet unclassified' }
Raindrops class >> drops [
	^ { 3 -> 'Pling'. 5 -> 'Plang'. 7 -> 'Plong' }
]

{ #category : #'as yet unclassified' }
Raindrops >> convertNumber: num [ 
    |sounds|
    sounds := self class drops select: [ :pair| num isDivisibleBy: (pair key) ] thenCollect: [ :pair | pair value ].
    ^ sounds ifEmpty: [num asString] ifNotEmpty: ['' join: sounds].
]
