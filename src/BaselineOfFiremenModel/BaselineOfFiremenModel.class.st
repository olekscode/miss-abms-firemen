Class {
	#name : #BaselineOfFiremenModel,
	#superclass : #BaselineOf,
	#category : #BaselineOfFiremenModel
}

{ #category : #baselines }
BaselineOfFiremenModel >> baseline: spec [

	<baseline>
	spec for: #common do: [

		"Packages"
		spec package: 'FiremenModel' ]
]
