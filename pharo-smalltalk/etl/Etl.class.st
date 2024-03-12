Class {
	#name : #Etl,
	#superclass : #Object,
	#category : #'Exercise@Etl'
}

{ #category : #'as yet unclassified' }
Etl >> transformData: old [ 
	^ (old associations 
			flatCollect: [ :assoc | assoc value 
				collect: [ :letter | letter asLowercase -> assoc key asInteger ] ]) asDictionary 
]
