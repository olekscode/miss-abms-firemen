Class {
	#name : #FiremenPlotAshState,
	#superclass : #FiremenPlotState,
	#category : #FiremenModel
}

{ #category : #'instance creation' }
FiremenPlotAshState >> color [

	^ Color gray 
]

{ #category : #testing }
FiremenPlotAshState >> isAshState [

	^ true
]

{ #category : #'instance creation' }
FiremenPlotAshState >> newState [

	^ self
]
