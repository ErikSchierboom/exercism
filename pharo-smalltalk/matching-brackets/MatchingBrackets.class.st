Class {
	#name : #MatchingBrackets,
	#superclass : #Object,
	#category : #'Exercise@MatchingBrackets'
}

{ #category : #testing }
MatchingBrackets >> isPaired: aString [ 
	|stack brackets|
	stack := Stack new.
	brackets := {
		$( -> [ stack push: $( ].
		$[ -> [ stack push: $[ ].
		${ -> [ stack push: ${ ].
		$) -> [ (stack isNotEmpty and: [ stack pop = $( ]) or: [ ^ false ] ].
		$] -> [ (stack isNotEmpty and: [ stack pop = $[ ]) or: [ ^ false ] ].
		$} -> [ (stack isNotEmpty and: [ stack pop = ${ ]) or: [ ^ false ] ].
	} asDictionary.
	aString do: [ :each | brackets at: each ifPresent: #value ].
	^ stack isEmpty
]
