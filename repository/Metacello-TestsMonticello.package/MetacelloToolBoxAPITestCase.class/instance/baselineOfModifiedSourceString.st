private BaselineOf
baselineOfModifiedSourceString
  ^ 'baseline: spec
	<baseline>
	spec for: #''common'' do: [
		spec project: ''MetacelloTestConfigurationOfFoo'' with: [
				spec
					className: ''MetacelloTestConfigurationOfFoo'';
					versionString: #''bleedingEdge'';
					repository: ''dictionary://Metacello_Dev_Cycle_Repository'' ].
		spec 
			package: ''GeauxFaux'' with: [
				spec requires: #(''MetacelloTestConfigurationOfFoo'' ''GoferFoo'' ). ];
			package: ''GeauxBeau'' with: [
				spec requires: #(''GeauxFaux'' ). ];
			package: ''GoferFoo''.
		spec 
			group: ''default'' with: #(''Core'' );
			group: ''Core'' with: #(''GeauxFaux'' );
			group: ''Tests'' with: #(''GeauxBeau'' );
			group: ''Core Tests'' with: #(''Core'' ''Tests'' ). ].
'