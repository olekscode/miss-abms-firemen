Class {
	#name : #FiremenPlotExtinguishedState,
	#superclass : #FiremenPlotState,
	#category : #FiremenModel
}

{ #category : #accessing }
FiremenPlotExtinguishedState >> color [

	^ Color gray
]

{ #category : #testing }
FiremenPlotExtinguishedState >> isExtinguishedState [

	^ true
]
