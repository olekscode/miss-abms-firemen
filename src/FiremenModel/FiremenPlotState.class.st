Class {
	#name : #FiremenPlotState,
	#superclass : #Object,
	#instVars : [
		'plot'
	],
	#category : #FiremenModel
}

{ #category : #'instance creation' }
FiremenPlotState class >> for: aPlot [

	^ self new
		plot: aPlot;
		yourself
]

{ #category : #accessing }
FiremenPlotState >> color [

	self subclassResponsibility
]

{ #category : #testing }
FiremenPlotState >> isEmptyState [

	^ false
]

{ #category : #testing }
FiremenPlotState >> isExtinguishedState [

	^ false
]

{ #category : #testing }
FiremenPlotState >> isFireState [

	^ false
]

{ #category : #testing }
FiremenPlotState >> isForestState [

	^ false
]

{ #category : #accessing }
FiremenPlotState >> newState [

	^ self
]

{ #category : #accessing }
FiremenPlotState >> plot: aPlot [

	plot := aPlot
]
