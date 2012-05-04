private
version12SourceString

	^'version12: spec
	<version: ''1.2'' imports: #(''1.2-baseline'' )>

	spec for: #''common'' do: [
		spec blessing: #''development''.
		spec project: ''MetacelloTestConfigurationOfFoo'' with: ''4.0''.
		spec 
			package: ''GeauxFaux'' with: ''GeauxFaux-tg.32'';
			package: ''GeauxBeau'' with: ''GeauxBeau-dkh.55''.

		spec for: #''nested'' do: [
			spec description: ''nested for:do: section''.
			spec 
				package: ''GoferFoo'' with: ''GoferFoo-lr.1'';
				package: ''GoferBar'' with: ''GoferBar-lr.0''. ]. ].

	spec for: #''nested'' do: [
		spec 
			package: ''GoofyFoo'' with: ''GoofyFoo'';
			package: ''GoofyBar'' with: ''GoofyBar''. ].

	spec for: #''outer'' do: [
		spec 
			package: ''DaffyFoo'' with: '''';
			package: ''DaffyBar'' with: ''''.

		spec for: #''nested'' do: [
			spec 
				package: ''GoofyFoo'' with: '''';
				package: ''GoofyBar'' with: ''''. ]. ].
'