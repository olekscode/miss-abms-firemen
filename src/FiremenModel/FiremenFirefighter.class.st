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

	self randomWalk
]
