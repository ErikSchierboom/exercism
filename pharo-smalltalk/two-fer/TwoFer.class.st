Class {
	#name : #TwoFer,
	#superclass : #Object,
	#category : #'Exercise@TwoFer'
}

{ #category : #'as yet unclassified' }
TwoFer >> who [
	^ self who: 'you'.
]

{ #category : #'as yet unclassified' }
TwoFer >> who: receiver [ 
	^ 'One for ' , receiver, ', one for me.'.
]
