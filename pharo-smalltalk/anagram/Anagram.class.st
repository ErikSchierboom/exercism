Class {
	#name : #Anagram,
	#superclass : #Object,
	#category : #'Exercise@Anagram'
}

{ #category : #'as yet unclassified' }
Anagram >> findAnagramsCandidates: candidates subject: subject [ 
	^ (candidates reject: [ :candidate | candidate sameAs: subject ]) select: [ :candidate |
	      	candidate asLowercase sorted = subject asLowercase sorted
	  ]
]
