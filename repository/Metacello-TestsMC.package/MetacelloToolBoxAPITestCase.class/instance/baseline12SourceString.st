private
baseline12SourceString

	^'baseline12: spec
	<version: ''1.2-baseline''>

	spec for: #''common'' do: [
		spec blessing: #''baseline''.
		spec repository: ''dictionary://Metacello_Dev_Cycle_Repository''.
		spec project: ''MetacelloTestConfigurationOfFoo'' with: [
				spec
					className: ''MetacelloTestConfigurationOfFoo'';
					versionString: #''bleedingEdge'';
					repository: ''cache'' ].
		spec 
			package: ''GeauxFaux'' with: [
				spec requires: #(''MetacelloTestConfigurationOfFoo'' ). ];
			package: ''GeauxBeau'' with: [
				spec requires: #(''GeauxFaux'' ). ].
		spec 
			group: ''default'' with: #(''Core'' );
			group: ''Core'' with: #(''GeauxFaux'' );
			group: ''Tests'' with: #(''GeauxBeau'' );
			group: ''Core Tests'' with: #(''Core'' ''Tests'' ).

		spec for: #''nested'' do: [
			spec 
				package: ''GoferFoo'';
				package: ''GoferBar'' with: [
					spec requires: #(''GoferFoo'' ). ].
			spec group: ''UI'' with: #(''GoferBar'' ). ]. ].

	spec for: #''nested'' do: [
		spec 
			package: ''GoofyFoo'';
			package: ''GoofyBar'' with: [
				spec requires: #(''GoofyFoo'' ). ].
		spec group: ''UI'' with: #(''GoofyBar'' ). ].

	spec for: #''outer'' do: [
		spec 
			package: ''DaffyFoo'';
			package: ''DaffyBar'' with: [
				spec requires: #(''DaffyFoo'' ). ].
		spec group: ''UI'' with: #(''DaffyBar'' ).

		spec for: #''nested'' do: [
			spec 
				package: ''GoofyFoo'';
				package: ''GoofyBar'' with: [
					spec requires: #(''GoofyFoo'' ). ].
			spec group: ''UI'' with: #(''GoofyBar'' ). ]. ].
'