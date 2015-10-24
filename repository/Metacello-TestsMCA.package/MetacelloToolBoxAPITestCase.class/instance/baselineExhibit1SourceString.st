private BaselineOf
baselineExhibit1SourceString
  ^ 'baseline: spec
	<baseline>
	spec for: #''pharo'' do: [
		spec 
			package: ''GoferFoo'';
			package: ''GoferBar'' with: [
				spec requires: #(''GoferFoo'' ). ].
		spec group: ''UI'' with: #(''GoferBar'' ). ].
'