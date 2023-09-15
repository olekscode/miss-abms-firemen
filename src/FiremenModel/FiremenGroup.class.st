"
I am a group of firefirhters. I help them share the information about the fire.
"
Class {
	#name : #FiremenGroup,
	#superclass : #OrderedCollection,
	#category : #FiremenModel
}

{ #category : #adding }
FiremenGroup >> add: aFirefighter [

	super add: aFirefighter.
	aFirefighter group: self.
]
