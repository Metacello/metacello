baselines-31
baseline310filesystem: spec
	<version: '3.1.0-filesystem-baseline' imports: #('3.1.0-common-baseline')>

	spec for: #'common' do: [
		spec blessing: #baseline.
		spec project: 'SPort2' with: [
			spec
				versionString: #stable;
				className: 'ConfigurationOfSPort2';
				loads: #('Sport');
				repository: 'http://www.squeaksource.com/MetacelloRepository' ].
		
		spec 
			package: 'Seaside-FileSystem' with: [
				spec 
					requires: #('Seaside-Core' 'SPort2');
					repository: 'http://www.squeaksource.com/Seaside30LGPL' ];
			package: 'Seaside-Tests-FileSystem' with: [
				spec 
					requires: #('Seaside-FileSystem');
					repository: 'http://www.squeaksource.com/Seaside30LGPL' ].
				
		spec
			group: 'Filesystem' with: #('Seaside-FileSystem' );
			group: 'Filesystem Tests' with: #('Seaside-Tests-FileSystem') ].
	
	spec for: #'gemstone' do: [
		
		spec 
			project: 'GsCore' with: [
				spec
					className: 'ConfigurationOfGsCore';
					versionString: #'stable'].
		spec
			package: 'Seaside-FileSystem' with: [
				spec requires: #('GsCore' ) ] ]