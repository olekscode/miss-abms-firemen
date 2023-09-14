Class {
	#name : #FiremenPlot,
	#superclass : #CMSpatialEntityCell,
	#category : #FiremenModel
}

{ #category : #accessing }
FiremenPlot class >> entityName [

	^ 'Plot'
]

{ #category : #'fire management' }
FiremenPlot >> extinguishFire [

	self state: #empty
]

{ #category : #testing }
FiremenPlot >> hasNeighboursOnFire [

	^ self neighbourhood anySatisfy: [ :neighbour | neighbour isFire ]
]

{ #category : #testing }
FiremenPlot >> isEmpty [

	^ state = #empty
]

{ #category : #testing }
FiremenPlot >> isFire [

	^ state = #fire
]

{ #category : #testing }
FiremenPlot >> isForest [

	^ state = #forest
]

{ #category : #control }
FiremenPlot >> newState [
	
	(self isForest and: [ self hasNeighboursOnFire ])
		ifTrue: [ self bufferState: #fire ]
		ifFalse: [ self bufferState: state ].
]

{ #category : #pov }
FiremenPlot >> pov [

	state = #forest ifTrue: [ ^ Color green ].
	state = #fire ifTrue: [ ^ Color red ].
	
	^ Color black
]
