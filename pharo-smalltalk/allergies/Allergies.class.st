Class {
	#name : #Allergies,
	#superclass : #Object,
	#category : #'Exercise@Allergies'
}

{ #category : #'as yet unclassified' }
Allergies class >> allergens [
  ^ {  
    'eggs' -> 1.
    'peanuts' -> 2.
    'shellfish' -> 4.
    'strawberries' -> 8.
    'tomatoes' -> 16.
    'chocolate' -> 32.
    'pollen' -> 64.
    'cats' -> 128
  } asOrderedDictionary
]

{ #category : #'as yet unclassified' }
Allergies >> allergicToItem: allergen forScore: score [ 
	^ score allMask: (self class allergens at: allergen)
]

{ #category : #'as yet unclassified' }
Allergies >> allergyListForScore: score [ 
	^ (self class allergens
	     associationsSelect: [ :pair | self allergicToItem: pair key forScore: score ])
		keys 
]
