private
version14SourceStringUpdated50
    ^ 'version14: spec
	<version: ''1.4'' imports: #(''1.4-baseline'' )>

	spec for: #''common'' do: [
		spec blessing: #''development''.
		spec package: ''GeauxFaux'' with: ''GeauxFaux-tg.32''. ].

	spec for: #''platform'' do: [
		spec project: ''MetacelloTestConfigurationOfFoo'' with: ''5.0''.
		spec package: ''GoferBar'' with: ''GoferBar-lr.1''. ].

	spec for: #''platform1.x'' do: [
		spec project: ''MetacelloTestConfigurationOfFoo'' with: ''4.0''.
		spec package: ''GeauxBeau'' with: ''GeauxBeau-dkh.55''. ].

	spec for: #''platform2.x'' do: [
		spec project: ''MetacelloTestConfigurationOfFoo'' with: ''5.0''.
		spec package: ''GoferFaux'' with: ''GoferFaux-tg.34''. ].

	spec for: #''platform2.1.x'' do: [
		spec project: ''MetacelloTestConfigurationOfFoo'' with: ''5.0''.
		spec package: ''GoferFoo'' with: ''GoferFoo-lr.2''. ].
'