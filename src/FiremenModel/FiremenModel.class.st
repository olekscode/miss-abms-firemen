Class {
	#name : #FiremenModel,
	#superclass : #CMAbstractModel,
	#instVars : [
		'thePlots'
	],
	#category : #FiremenModel
}

{ #category : #init }
FiremenModel >> init [

	self createGridLines: 30 columns: 30 neighbourhood: 8 closed: false.
	
	thePlots do: [ :each | 
		each state: (Cormas random < 0.5
			ifTrue: [ #forest ]
			ifFalse: [ #empty ]) ].
		
	(self pickEntity: FiremenPlot) state: #fire.
]

{ #category : #initialization }
FiremenModel >> initialize [

	super initialize.
	thePlots := OrderedCollection new.
]

{ #category : #control }
FiremenModel >> step: t [

	self stepSynchronouslyCA: t
]

{ #category : #accessing }
FiremenModel >> thePlots [

	^ thePlots
]
