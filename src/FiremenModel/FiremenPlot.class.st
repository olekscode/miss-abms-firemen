Class {
	#name : #FiremenPlot,
	#superclass : #CMSpatialEntityCell,
	#category : #FiremenModel
}

{ #category : #accessing }
FiremenPlot class >> entityName [

	^ 'Plot'
]

{ #category : #'plot management' }
FiremenPlot >> extinguishFire [

	self state: (FiremenPlotEmptyState for: self)
]

{ #category : #'plot management' }
FiremenPlot >> generateForest [

	self state: (FiremenPlotForestState for: self)
]

{ #category : #initialization }
FiremenPlot >> initialize [

	super initialize.
	state := FiremenPlotEmptyState for: self.
]

{ #category : #testing }
FiremenPlot >> isAsh [

	^ state isAshState
]

{ #category : #testing }
FiremenPlot >> isEmpty [

	^ state isEmptyState
]

{ #category : #testing }
FiremenPlot >> isFire [

	^ state isFireState
]

{ #category : #testing }
FiremenPlot >> isForest [

	^ state isForestState
]

{ #category : #control }
FiremenPlot >> newState [
	
	self bufferState: state newState
]

{ #category : #pov }
FiremenPlot >> pov [

	^ state color
]

{ #category : #'plot management' }
FiremenPlot >> setOnFire [

	self state: (FiremenPlotFireState for: self)
]
