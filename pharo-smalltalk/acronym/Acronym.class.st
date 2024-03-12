Class {
	#name : #Acronym,
	#superclass : #Object,
	#category : #'Exercise@Acronym'
}

{ #category : #'as yet unclassified' }
Acronym >> abbreviatePhrase: sentence [ 
	^ (sentence asUppercase regex: '[[:alpha:]'']+' matchesCollect: [ :m | m at: 1 ]) as:String
]
