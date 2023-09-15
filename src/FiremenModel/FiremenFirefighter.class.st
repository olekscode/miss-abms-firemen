Class {
	#name : #FiremenFirefighter,
	#superclass : #CMAgent,
	#traits : 'TCMLocated',
	#classTraits : 'TCMLocated classTrait',
	#instVars : [
		'group'
	],
	#category : #FiremenModel
}

{ #category : #accessing }
FiremenFirefighter class >> entityName [

	^ 'Firefighter'
]

{ #category : #accessing }
FiremenFirefighter >> group [ 

	^ group
]

{ #category : #accessing }
FiremenFirefighter >> group: aGroup [

	group := aGroup
]

{ #category : #pov }
FiremenFirefighter >> pov [

	^ Color blue
]

{ #category : #stepping }
FiremenFirefighter >> step [

	self walkToFire.
	self patch isFire ifTrue: [ self patch extinguishFire ].
]

{ #category : #'as yet unclassified' }
FiremenFirefighter >> walkToFire [

	self patch neighbourhood
		detect: [ :neighbour | neighbour isFire ]
		ifFound: [ :neighbour | self moveTo: neighbour ]
		ifNone: [ self randomWalk ]
]
