Class {
	#name : #FiremenModel,
	#superclass : #CMAbstractModel,
	#instVars : [
		'numberOfFirefighters',
		'thePlots',
		'theFirefighters',
		'groups'
	],
	#category : #FiremenModel
}

{ #category : #'- probes' }
FiremenModel class >> colorOfProbe_probeNumberOfForestPlots [

  ^ Color green
]

{ #category : #'- probes' }
FiremenModel class >> colorOfProbe_probeNumberOfPlotsOnFire [

  ^ Color red
]

{ #category : #'as yet unclassified' }
FiremenModel >> divideFirefightersIntoGroups: aNumberOfGroups [

	| group groupColors groupSize firstMemberIndex |
	
	"This is a color palette - just an array of colors"
	groupColors := RSQualitativeColorPalette new set312 range.
	
	aNumberOfGroups > groupColors size
		ifTrue: [ self error: 'Too many groups! We do not have enough colors' ].
		
	groupSize := (numberOfFirefighters / aNumberOfGroups) asInteger.
	
	firstMemberIndex := 1.

	1 to: aNumberOfGroups do: [ :groupIndex |
		group := FiremenGroup new.
		group color: (groupColors at: groupIndex).
		
		firstMemberIndex to: firstMemberIndex + groupSize - 1 do: [ :memberIndex |
			group add: (theFirefighters at: memberIndex) ].
		
		groups add: group.
		firstMemberIndex := firstMemberIndex + groupSize ].
	
	"Remaining firefighters"
	firstMemberIndex = theFirefighters size ifFalse: [ 
		firstMemberIndex to: theFirefighters size do: [ :memberIndex |
			groups last add: (theFirefighters at: memberIndex) ] ]
]

{ #category : #init }
FiremenModel >> init [

	self createGridLines: 50 columns: 50 neighbourhood: 8 closed: true.
	
	thePlots do: [ :plot | 
		Cormas random < 0.5 ifTrue: [
			plot generateForest ] ].
		
	(self pickEntity: FiremenPlot) setOnFire.
	
	self createN: numberOfFirefighters randomlyLocatedAloneEntities: FiremenFirefighter.
	
	self displayPov: #pov of: FiremenFirefighter.
	self displayPov: #pov of: FiremenPlot.
]

{ #category : #init }
FiremenModel >> initGroups1 [

	self init.
	self divideFirefightersIntoGroups: 1.
]

{ #category : #init }
FiremenModel >> initGroups12 [

	self init.
	self divideFirefightersIntoGroups: 12.
]

{ #category : #init }
FiremenModel >> initGroups2 [

	self init.
	self divideFirefightersIntoGroups: 2.
]

{ #category : #init }
FiremenModel >> initGroups3 [

	self init.
	self divideFirefightersIntoGroups: 3.
]

{ #category : #init }
FiremenModel >> initGroups4 [

	self init.
	self divideFirefightersIntoGroups: 4.
]

{ #category : #init }
FiremenModel >> initGroups6 [

	self init.
	self divideFirefightersIntoGroups: 6.
]

{ #category : #initialization }
FiremenModel >> initialize [

	super initialize.
	
	numberOfFirefighters := 12.
	
	thePlots := OrderedCollection new.
	theFirefighters := OrderedCollection new.
	groups := OrderedCollection new.
]

{ #category : #probes }
FiremenModel >> probeNumberOfForestPlots [

	<probe>
	^ (thePlots select: [ :plot | plot isForest ]) size
]

{ #category : #probes }
FiremenModel >> probeNumberOfPlotsOnFire [

	<probe>
	^ (thePlots select: [ :plot | plot isFire ]) size
]

{ #category : #control }
FiremenModel >> step: t [

	self askRandom: FiremenFirefighter toDo: #step.
	self stepSynchronouslyCA: t.
]

{ #category : #accessing }
FiremenModel >> theFirefighters [

	^ theFirefighters
]

{ #category : #accessing }
FiremenModel >> thePlots [

	^ thePlots
]
