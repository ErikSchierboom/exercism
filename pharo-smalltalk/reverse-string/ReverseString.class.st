Class {
	#name : #ReverseString,
	#superclass : #Object,
	#category : #'Exercise@ReverseString'
}

{ #category : #'as yet unclassified' }
ReverseString >> reverseValue: str [ 
	^ String streamContents: [ :out |
	      str size to: 1 by: -1 do:[ :i | out nextPut: (str at: i) ] ].
]
