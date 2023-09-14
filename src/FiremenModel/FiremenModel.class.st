Class {
	#name : #FiremenModel,
	#superclass : #CMAbstractModel,
	#instVars : [
		'thePlots',
		'theFirefighters',
		'theCows'
	],
	#category : #FiremenModel
}

{ #category : #init }
FiremenModel >> init [

	self createGridLines: 30 columns: 30 neighbourhood: 8 closed: true.
	
	thePlots do: [ :each | 
		each state: (Cormas random < 0.5
			ifTrue: [ #forest ]
			ifFalse: [ #empty ]) ].
		
	(self pickEntity: FiremenPlot) state: #fire.
	
	self createN: 3 randomlyLocatedAloneEntities: FiremenFirefighter.
]

{ #category : #initialization }
FiremenModel >> initialize [

	super initialize.
	thePlots := OrderedCollection new.
	theFirefighters := OrderedCollection new.
	theCows := OrderedCollection new.
]

{ #category : #control }
FiremenModel >> step: t [

	self stepSynchronouslyCA: t.
	self askRandom: FiremenFirefighter toDo: #step.
]

{ #category : #accessing }
FiremenModel >> theCows [

	^ theCows
]

{ #category : #accessing }
FiremenModel >> theFirefighters [

	^ theFirefighters
]

{ #category : #accessing }
FiremenModel >> thePlots [

	^ thePlots
]
