Class {
	#name : #Sieve,
	#superclass : #Object,
	#category : #'Exercise@Sieve'
}

{ #category : #'as yet unclassified' }
Sieve >> primesLimit: limit [
	|sieve primes|
	sieve := Array new: limit withAll: true.
	sieve at: 1 put: false.
   primes := OrderedCollection new.

	2 to: limit do: [ :i | 
		(sieve at: i) ifTrue: [ 
			primes add: i.
			sieve atAll: (i squared to: limit by: i) put: false
		]
	].
	^ primes asArray
]
