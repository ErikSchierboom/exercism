Class {
	#name : #FlattenArray,
	#superclass : #Object,
	#category : #'Exercise@FlattenArray'
}

{ #category : #'as yet unclassified' }
FlattenArray >> flattenArray: aCollection [
	^ aCollection flattened reject: #isNil
]
