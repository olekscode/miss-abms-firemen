Class {
	#name : #FiremenPlotForestState,
	#superclass : #FiremenPlotState,
	#category : #FiremenModel
}

{ #category : #accessing }
FiremenPlotForestState >> color [

	^ Color green
]

{ #category : #testing }
FiremenPlotForestState >> hasNeighboursOnFire [

	^ plot neighbourhood anySatisfy: [ :neighbour | neighbour isFire ]
]

{ #category : #testing }
FiremenPlotForestState >> isForestState [

	^ true
]

{ #category : #'instance creation' }
FiremenPlotForestState >> newState [

	^ self hasNeighboursOnFire
		ifTrue: [ FiremenPlotFireState for: plot ]
		ifFalse: [ self ]
]
