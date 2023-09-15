Class {
	#name : #FiremenModel,
	#superclass : #CMAbstractModel,
	#instVars : [
		'thePlots',
		'theFirefighters',
		'groups'
	],
	#category : #FiremenModel
}

{ #category : #'as yet unclassified' }
FiremenModel >> divideFirefightersIntoGroups [

	| group1 group2 |
	
	group1 := FiremenGroup new.
	group2 := FiremenGroup new.
	
	1 to: 6 do: [ :index |
		group1 add: (theFirefighters at: index) ].
	
	7 to: 12 do: [ :index |
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
	
	self createN: 12 randomlyLocatedAloneEntities: FiremenFirefighter.
	
	self divideFirefightersIntoGroups.
]

{ #category : #initialization }
FiremenModel >> initialize [

	super initialize.
	thePlots := OrderedCollection new.
	theFirefighters := OrderedCollection new.
	groups := OrderedCollection new.
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
