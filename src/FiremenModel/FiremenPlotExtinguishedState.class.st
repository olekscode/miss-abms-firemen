Class {
	#name : #FiremenPlotExtinguishedState,
	#superclass : #FiremenPlotState,
	#category : #FiremenModel
}

{ #category : #accessing }
FiremenPlotExtinguishedState >> color [

	^ Color veryVeryLightGray
]

{ #category : #testing }
FiremenPlotExtinguishedState >> isExtinguishedState [

	^ true
]

{ #category : #'instance creation' }
FiremenPlotExtinguishedState >> newState [

	^ self
]
