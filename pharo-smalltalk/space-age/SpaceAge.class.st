Class {
	#name : #SpaceAge,
	#superclass : #Object,
	#category : #'Exercise@SpaceAge'
}

{ #category : #'as yet unclassified' }
SpaceAge class >> orbitalPeriod [
	^ { 
		'Earth' -> 1.0.
		'Mercury' -> 0.2408467.
		'Venus' -> 0.61519726.
		'Mars' -> 1.8808158.
		'Jupiter' -> 11.862615.
		'Saturn' -> 29.447498.
		'Uranus' -> 84.016846.
		'Neptune' -> 164.79132.
	} asDictionary
]

{ #category : #'as yet unclassified' }
SpaceAge class >> secondsInEarthYear [
	^ 31557600.0
]

{ #category : #'as yet unclassified' }
SpaceAge >> ageOnPlanet: planet at: ageInSeconds [ 
	^ ageInSeconds / self class secondsInEarthYear / (self class orbitalPeriod at: planet).

]
