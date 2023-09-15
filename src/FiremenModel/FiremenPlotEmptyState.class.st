Class {
	#name : #FiremenPlotEmptyState,
	#superclass : #FiremenPlotState,
	#category : #FiremenModel
}

{ #category : #'instance creation' }
FiremenPlotEmptyState >> color [

	^ Color black
]

{ #category : #testing }
FiremenPlotEmptyState >> isEmptyState [

	^ true
]
