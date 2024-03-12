Class {
	#name : #GradeSchool,
	#superclass : #Object,
	#instVars : [
		'students'
	],
	#category : #'Exercise@GradeSchool'
}

{ #category : #adding }
GradeSchool >> addStudent: student to: grade [
  (students at: grade ifAbsentPut: [ SortedCollection new ]) add: student
]

{ #category : #adding }
GradeSchool >> addStudents: newStudents [ 
	newStudents do: [ :pair | self addStudent: pair first to: pair second ]
]

{ #category : #'as yet unclassified' }
GradeSchool >> desiredGrade: grade [ 
	^ (students at: grade ifAbsentPut: [ SortedCollection new ]) asArray 
]

{ #category : #initialization }
GradeSchool >> initialize [
	students := OrderedDictionary new
]

{ #category : #'as yet unclassified' }
GradeSchool >> roster [
	^ students keysSortedSafely flatCollect: [ :grade | self desiredGrade: grade ]
]
