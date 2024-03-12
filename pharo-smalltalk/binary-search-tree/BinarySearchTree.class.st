Class {
	#name : #BinarySearchTree,
	#superclass : #Object,
	#instVars : [
		'data',
		'left',
		'right'
	],
	#category : #'Exercise@BinarySearchTree'
}

{ #category : #accessing }
BinarySearchTree >> data [
	^ data
]

{ #category : #accessing }
BinarySearchTree >> insert: newData [ 
	newData <= data
		ifTrue: [
			left
				ifNil: [ left := self class new treeData: (OrderedCollection new add: newData; yourself) ]
				ifNotNil: [ left insert: newData ]
		]
		ifFalse: [
			right
				ifNil: [ right := self class new treeData: (OrderedCollection new add: newData; yourself) ]
			 	ifNotNil: [ right insert: newData ] 
		]
]

{ #category : #accessing }
BinarySearchTree >> left [
	^ left
]

{ #category : #accessing }
BinarySearchTree >> right [
	^ right
]

{ #category : #'as yet unclassified' }
BinarySearchTree >> sortedData [
	|sorted|
	sorted := OrderedCollection new.
	left ifNotNil: [ sorted addAll: left sortedData ].
	sorted add: data.
	right ifNotNil: [ sorted addAll: right sortedData ].
	^ sorted asArray
]

{ #category : #'as yet unclassified' }
BinarySearchTree >> treeData: aCollection [ 
	data := aCollection first.
	aCollection allButFirst do: [ :each | self insert: each ]
]
