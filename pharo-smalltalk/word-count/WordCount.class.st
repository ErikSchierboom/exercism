Class {
	#name : #WordCount,
	#superclass : #Object,
	#category : #'Exercise@WordCount'
}

{ #category : #'as yet unclassified' }
WordCount >> countWordsSentence: sentence [ 
	^ (sentence asLowercase allRegexMatches: '\w+(''\w)*') asBag valuesAndCounts
]
