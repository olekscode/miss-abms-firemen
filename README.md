# miss-abms-firemen

```st
Metacello new
    repository: 'github://olekscode/miss-abms-firemen:main';
    baseline: 'FiremenModel';
    load.
```

```st
followTheGroupSlowlyOrWalkRandomly

	| allGroupNeigbourPlots plotsOnFire closestPlotOnFire "closestNeighbour" |
	
	allGroupNeigbourPlots := group flatCollect: [ :firefighter | firefighter patch neighbourhood ].
	plotsOnFire := allGroupNeigbourPlots select: [ :plot | plot isFire ].
	
	plotsOnFire ifEmpty: [ 
		self randomWalk.
		^ self ].
	
	closestPlotOnFire := plotsOnFire anyOne.
	
	plotsOnFire do: [ :plot |
		(self patch distanceTo: plot) < (self patch distanceTo: closestPlotOnFire)
			ifTrue: [ closestPlotOnFire := plot ] ].
		
	"closestNeighbour := self patch neighbourhood anyOne.
	
	self patch neighbourhood do: [ :plot |
		(closestPlotOnFire distanceTo: plot) < (closestPlotOnFire distanceTo: closestNeighbour)
			ifTrue: [ closestNeighbour := plot ] ]."
	
	"self moveTo: closestNeighbour."
	
	self moveTowards: closestPlotOnFire.
```
