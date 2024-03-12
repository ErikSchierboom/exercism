Class {
	#name : #CircularBuffer,
	#superclass : #Object,
	#instVars : [
		'buffer',
		'count',
		'capacity',
		'head',
		'tail'
	],
	#category : #'Exercise@CircularBuffer'
}

{ #category : #'as yet unclassified' }
CircularBuffer >> capacity: size [ 
	buffer := Array new: size.
	capacity := size.
	count := 0.
	head := 0.
	tail := 0.
]

{ #category : #accessing }
CircularBuffer >> clear [
	head := 0.
	tail := 0.
	count := 0
]

{ #category : #testing }
CircularBuffer >> isEmpty [
	^ count = 0
]

{ #category : #testing }
CircularBuffer >> isFull [
	^ count = capacity
]

{ #category : #writing }
CircularBuffer >> overwrite: value [ 
	self isFull
		ifTrue: [ 
			buffer at: tail + 1 put: value.
	      head := head + 1 \\ capacity.
	      tail := tail + 1 \\ capacity.
		]
		ifFalse: [ self write: value ]
	
]

{ #category : #'meta-object-protocol' }
CircularBuffer >> read [
	|value|
	self isEmpty ifTrue: [ ^ self error: 'Cannot read from empty list' ].
	count := count - 1.
	value := buffer at: tail + 1.
	tail := tail + 1 \\ capacity.
	^ value
	
]

{ #category : #writing }
CircularBuffer >> write: value [
	self isFull ifTrue: [ self error: 'Cannot write to full buffer' ].
	buffer at: head + 1 put: value.
	head := head + 1 \\ capacity.
	count := count + 1.
]
