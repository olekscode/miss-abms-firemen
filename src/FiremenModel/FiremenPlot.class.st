Class {
	#name : #FiremenPlot,
	#superclass : #CMSpatialEntityCell,
	#category : #FiremenModel
}

{ #category : #accessing }
FiremenPlot class >> entityName [

	^ 'Plot'
]

{ #category : #pov }
FiremenPlot >> pov [

	state = #forest ifTrue: [ ^ Color green ].
	state = #fire ifTrue: [ ^ Color red ].
	
	^ Color black
]
