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
FiremenModel >> divideFirefightersIntoGroups [

	| group1 group2 |
	
	group1 := FiremenGroup new.
	group2 := FiremenGroup new.
	
	group1 color: Color yellow.
	group2 color: Color purple.
	
	1 to: (numberOfFirefighters / 2) do: [ :index |
		group1 add: (theFirefighters at: index) ].
	
	(numberOfFirefighters / 2) + 1 to: numberOfFirefighters do: [ :index |
		group2 add: (theFirefighters at: index) ].
	
	groups add: group1.
	groups add: group2.
]

{ #category : #init }
FiremenModel >> init [

	self createGridLines: 30 columns: 30 neighbourhood: 8 closed: true.
	
	thePlots do: [ :each | 
		each state: (Cormas random < 0.5
			ifTrue: [ #forest ]
			ifFalse: [ #empty ]) ].
		
	(self pickEntity: FiremenPlot) state: #fire.
	
	self createN: numberOfFirefighters randomlyLocatedAloneEntities: FiremenFirefighter.
	
	self divideFirefightersIntoGroups.
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
