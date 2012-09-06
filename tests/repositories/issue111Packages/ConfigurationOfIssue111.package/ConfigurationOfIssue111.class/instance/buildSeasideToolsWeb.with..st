baselines-31
buildSeasideToolsWeb: aString with: spec
	spec
		package: 'Seaside-Tools-Web' with: [
				spec includes: (Array with: aString) ];
		package: 'Seaside-Pharo-Development' with: [
			spec requires: (Array with: 'Seaside-Development' with: aString with: 'Seaside-Pharo-Flow' ). ];
		package: aString with: [
				spec requires: #('Seaside-Tools-Web' 'Seaside-Core' 'Seaside-Canvas' ) ]