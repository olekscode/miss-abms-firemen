"
I am a group of firefirhters. I help them share the information about the fire.
"
Class {
	#name : #FiremenGroup,
	#superclass : #OrderedCollection,
	#instVars : [
		'color'
	],
	#category : #FiremenModel
}

{ #category : #adding }
FiremenGroup >> add: aFirefighter [

	super add: aFirefighter.
	aFirefighter group: self.
]

{ #category : #accessing }
FiremenGroup >> color [

	^ color
]

{ #category : #accessing }
FiremenGroup >> color: aColor [

	color := aColor
]
