baselines-31
buildObConfiguration: confirationName loading: aGroup with: spec

	spec blessing: #baseline.
	spec
		project: 'OB' with: [
			spec
				className: confirationName;
				versionString: #'stable';
				loads: (Array with: aGroup);
				repository: 'http://www.squeaksource.com/MetacelloRepository' ].
		
	spec
		package: 'Seaside-Pharo-Tools-OmniBrowser' with: [
			spec requires: #('Seaside-Tools-OmniBrowser') ].
	spec
		 package: 'Seaside-Tools-OmniBrowser' with: [
			spec 
				requires: #('OB' 'Seaside-Tools-Core');
				includes: #('Seaside-Pharo-Tools-OmniBrowser' ) ].
	spec 
		group: 'OmniBrowser' with: #('Seaside-Tools-OmniBrowser')