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

{ #category : #stepping }
FiremenFirefighter >> followTheGroupOrWalkRandomly [

	| allGroupNeigbourPlots |
	
	allGroupNeigbourPlots := group flatCollect: [ :firefighter | firefighter patch neighbourhood ].
	
	allGroupNeigbourPlots
		detect: [ :plot | plot isFire ]
		ifFound:  [ :plot | self moveTo: plot ]
		ifNone: [ self randomWalk ].
]

{ #category : #stepping }
FiremenFirefighter >> followTheGroupSlowlyOrWalkRandomly [

	| allGroupNeigbourPlots plotsOnFire closestPlotOnFire "closestNeighbour" |
	
	allGroupNeigbourPlots := group flatCollect: [ :firefighter | firefighter patch neighbourhood ].
	plotsOnFire := allGroupNeigbourPlots select: [ :plot | plot isFire ].
	
	plotsOnFire ifEmpty: [ 
		self randomWalk.
		^ self ].
	
	closestPlotOnFire := plotsOnFire anyOne.
	
	plotsOnFire do: [ :plot |
		(self patch distanceTo: plot) < (self patch distanceTo: closestPlotOnFire)
			ifTrue: [ closestPlotOnFire := plot ] ].
		
	"closestNeighbour := self patch neighbourhood anyOne.
	
	self patch neighbourhood do: [ :plot |
		(closestPlotOnFire distanceTo: plot) < (closestPlotOnFire distanceTo: closestNeighbour)
			ifTrue: [ closestNeighbour := plot ] ]."
	
	"self moveTo: closestNeighbour."
	
	self moveTowards: closestPlotOnFire.
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

	"^ Color blue"
	^ self povGroup
]

{ #category : #pov }
FiremenFirefighter >> povGroup [

	^ group color
]

{ #category : #povSize }
FiremenFirefighter >> sizeOfPOV [

	^ 35
]

{ #category : #stepping }
FiremenFirefighter >> step [

	self walkToFire.
	self patch isFire ifTrue: [ self patch extinguishFire ].
]

{ #category : #stepping }
FiremenFirefighter >> walkToFire [

	self patch neighbourhood
		detect: [ :neighbour | neighbour isFire ]
		ifFound: [ :neighbour | self moveTo: neighbour ]
		ifNone: [ self followTheGroupSlowlyOrWalkRandomly ]
]
