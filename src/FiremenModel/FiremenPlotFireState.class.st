Class {
	#name : #FiremenPlotFireState,
	#superclass : #FiremenPlotState,
	#instVars : [
		'stepCount',
		'stepsToBurn'
	],
	#category : #FiremenModel
}

{ #category : #accessing }
FiremenPlotFireState >> color [

	^ Color red
]

{ #category : #initialization }
FiremenPlotFireState >> initialize [ 

	super initialize.
	
	stepCount := 1.
	stepsToBurn := 10.
]

{ #category : #testing }
FiremenPlotFireState >> isFireState [ 
	
	^ true
]

{ #category : #'instance creation' }
FiremenPlotFireState >> newState [
	
	^ stepCount < stepsToBurn
		ifFalse: [ FiremenPlotAshState for: plot ]
		ifTrue: [
			stepCount := stepCount + 1.
			^ self ]
]
