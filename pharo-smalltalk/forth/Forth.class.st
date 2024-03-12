Class {
	#name : #Forth,
	#superclass : #Object,
	#instVars : [
		'stack',
		'defaultWords',
		'userWords'
	],
	#category : #'Exercise@Forth'
}

{ #category : #'as yet unclassified' }
Forth >> defineUserWord: words [ 
	|word instructions|
	word := words at: 2.
	instructions := (words allButLast allButFirst: 2) flatCollect: [ :instruction |
		userWords at: instruction
			ifPresent: [ :userWordInstructions | userWordInstructions ]
			ifAbsent: [ (OrderedCollection new) add: instruction; yourself ]
	].
	word isAllDigits
		ifTrue: [ self error: 'illegal operation' ]
		ifFalse: [ userWords at: word put: instructions ]
]

{ #category : #'as yet unclassified' }
Forth >> evaluateBinaryInstruction: aBlock [
	|l r|
	stack ifEmpty: [ self error: 'empty stack' ].
	stack size = 1 ifTrue: [ self error: 'only one value on the stack' ].
	r := stack pop.
	l := stack pop.
	aBlock value: l value: r
]

{ #category : #'as yet unclassified' }
Forth >> evaluateInstruction: instruction [
	userWords at: instruction
		ifPresent: [ :words | self evaluateWords: words ]
		ifAbsent: [ 
			defaultWords at: instruction
				ifPresent: [ :block | block value ]
				ifAbsent: [ 
					instruction isAllDigits
						ifTrue: [ stack push: instruction asInteger ]
						ifFalse: [ self error: 'undefined operation' ]	
				]
		 ]
]

{ #category : #'as yet unclassified' }
Forth >> evaluateInstructions: instructions [ 
	stack removeAll.
	instructions do: [ :words | self evaluateWords: words asLowercase substrings ].
	^ stack asArray reversed
]

{ #category : #'as yet unclassified' }
Forth >> evaluateUnaryInstruction: aBlock [
	stack ifEmpty: [ self error: 'empty stack' ].
	aBlock value: stack pop.
]

{ #category : #'as yet unclassified' }
Forth >> evaluateUserWord: instructions [
	self evaluateWords: instructions
]

{ #category : #'as yet unclassified' }
Forth >> evaluateWords: words [ 
	(words first = ':')
		ifTrue: [ self defineUserWord: words ]
		ifFalse: [ words do: [ :instruction | self evaluateInstruction: instruction ] ]
]

{ #category : #initialization }
Forth >> initialize [
	stack := Stack new.
	defaultWords := (Dictionary new)
		at: '+' put: [ self evaluateBinaryInstruction: [ :l :r | stack push: l + r ] ];
		at: '-' put: [ self evaluateBinaryInstruction: [ :l :r | stack push: l - r ] ];
		at: '*' put: [ self evaluateBinaryInstruction: [ :l :r | stack push: l * r ] ];
      at: '/' put: [ self evaluateBinaryInstruction: [ :l :r | r isZero ifTrue: [ self error: 'divide by zero' ] ifFalse: [ stack push: l // r ] ] ];
		at: 'dup' put: [ self evaluateUnaryInstruction: [ :o | stack push: o; push: o ] ];
		at: 'drop' put: [ self evaluateUnaryInstruction: [ :o | ] ];
		at: 'swap' put: [ self evaluateBinaryInstruction: [ :l :r | stack push: r; push: l ] ];
		at: 'over' put: [ self evaluateBinaryInstruction: [ :l :r | stack push: l; push: r; push: l ] ];
		yourself.
	userWords := Dictionary new

]
