Class {
	#name : #ArmstrongNumbers,
	#superclass : #Object,
	#category : #'Exercise@ArmstrongNumbers'
}

{ #category : #testing }
ArmstrongNumbers >> isArmstrongNumber: anInteger [
	^ (anInteger asString 
		  inject: 0
		  into: [ :sum :digit | sum + (digit digitValue raisedTo: anInteger numberOfDigits)])
		= anInteger
]
