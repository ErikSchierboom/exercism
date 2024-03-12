Class {
	#name : #TwelveDays,
	#superclass : #Object,
	#category : #'Exercise@TwelveDays'
}

{ #category : #accessing }
TwelveDays >> days [
	^ #( 
		'first'
		'second'
		'third'
		'fourth'
		'fifth'
		'sixth'
		'seventh'
		'eighth'
		'ninth'
		'tenth'
		'eleventh'
		'twelfth' )
]

{ #category : #'as yet unclassified' }
TwelveDays >> reciteStartVerse: start endVerse: end [ 
	^ ((start to: end) collect: [ :n | self verse: n ])
]

{ #category : #'as yet unclassified' }
TwelveDays >> subjects [
	^ #( 
		'a Partridge in a Pear Tree'
		'two Turtle Doves'
		'three French Hens'
		'four Calling Birds'
		'five Gold Rings'
		'six Geese-a-Laying'
		'seven Swans-a-Swimming'
		'eight Maids-a-Milking'
		'nine Ladies Dancing'
		'ten Lords-a-Leaping'
		'eleven Pipers Piping'
		'twelve Drummers Drumming' )
]

{ #category : #'as yet unclassified' }
TwelveDays >> verse: number [
	|day gifts|
	day := self days at: number.
	gifts := ((self subjects first: number) reversed joinUsing: ', ') copyReplaceAll: ', a' with: ', and a'.
	^ 'On the ', day ,' day of Christmas my true love gave to me: ', gifts, '.'
]
