Class {
	#name : #Matrix,
	#superclass : #Object,
	#category : #'Exercise@Matrix'
}

{ #category : #converting }
Matrix class >> asMatrix: aString [
	|matrix|
	matrix := aString lines collect: #parseLiterals.
	^ Array2D
		rows: matrix size
		columns: matrix first size
		tabulate: [ :i :j | (matrix at: i) at: j ]
]

{ #category : #'as yet unclassified' }
Matrix >> input: aString atColumn: column [ 
	^ (self class asMatrix: aString) atColumn: column
]

{ #category : #'as yet unclassified' }
Matrix >> input: aString atRow: row [ 
	^ (self class asMatrix: aString) atRow: row
]
