Class {
	#name : #ArmstrongNumbers,
	#superclass : #Object,
	#category : #'Exercise@ArmstrongNumbers'
}

{ #category : #testing }
ArmstrongNumbers >> isArmstrongNumber: num [
   |armstrongSum|
   armstrongSum := (1 to: num numberOfDigits) sum: [ :i | (num decimalDigitAt: i) raisedTo: num numberOfDigits ].
   ^ armstrongSum = num
]
