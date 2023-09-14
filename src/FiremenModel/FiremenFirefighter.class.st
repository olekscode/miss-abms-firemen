Class {
	#name : #FiremenFirefighter,
	#superclass : #CMAgent,
	#traits : 'TCMLocated',
	#classTraits : 'TCMLocated classTrait',
	#category : #FiremenModel
}

{ #category : #accessing }
FiremenFirefighter class >> entityName [

	^ 'Firefighter'
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
