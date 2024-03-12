Class {
	#name : #SecretHandshake,
	#superclass : #Object,
	#category : #'Exercise@SecretHandshake'
}

{ #category : #'as yet unclassified' }
SecretHandshake class >> encodedCommands [
	^ {  
		1 -> [ :acc | acc add: 'wink'; yourself ].
		2 -> [ :acc | acc add: 'double blink'; yourself ].
		4 -> [ :acc | acc add: 'close your eyes'; yourself ].
		8 -> [ :acc | acc add: 'jump'; yourself ].
		16 -> [ :acc | acc reversed  ].
   }
]

{ #category : #'as yet unclassified' }
SecretHandshake >> commandsNumber: encodedCommand [ 
	^ (self class encodedCommands
	    inject: OrderedCollection new
	    into: [ :acc :command | 
			(encodedCommand allMask: command key)
				ifTrue: [ command value value: acc ]
				ifFalse: [ acc ] ])
	  asArray
]
