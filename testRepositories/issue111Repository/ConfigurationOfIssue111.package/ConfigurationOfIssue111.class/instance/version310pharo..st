versions-31
version310pharo: spec
	<version: '3.1.0-pharo' imports: #('3.1.0-pharo-baseline' )>
	
	spec for: #'squeakCommon' do: [
		spec
			package: 'Seaside-Pharo-Canvas' with: 'Seaside-Pharo-Canvas-pmm.4';
			package: 'Seaside-Pharo-Continuation' with: 'Seaside-Pharo-Continuation-lr.5';
			package: 'Seaside-Pharo-Core' with: 'Seaside-Pharo-Core-pmm.21';
			package: 'Seaside-Pharo20-Core' with: 'Seaside-Pharo20-Core-pmm.3';
			package: 'Seaside-Pharo-Development' with: 'Seaside-Pharo-Development-pmm.60';
			package: 'Seaside-Pharo-Email' with: 'Seaside-Pharo-Email-pmm.14';
			package: 'Seaside-Pharo-Environment' with: 'Seaside-Pharo-Environment-lr.6';
			package: 'Seaside-Pharo-Flow' with: 'Seaside-Pharo-Flow-lr.5';
			package: 'Seaside-Pharo-Tools-Web' with: 'Seaside-Pharo-Tools-Web-pmm.44';
			package: 'Seaside-Pharo20-Tools-Web' with: 'Seaside-Pharo20-Tools-Web-SvenVanCaekenberghe.1';
			package: 'Seaside-Tests-Pharo-Continuation' with: 'Seaside-Tests-Pharo-Continuation-lr.8';
			package: 'Seaside-Tests-Pharo-Core' with: 'Seaside-Tests-Pharo-Core-pmm.28';
			package: 'Seaside-Tests-Pharo20-Core' with: 'Seaside-Tests-Pharo20-Core-pmm.2';
			package: 'Seaside-Tests-Pharo-Development' with: 'Seaside-Tests-Pharo-Development-pmm.23';
			package: 'Seaside-Tests-Pharo-Email' with: 'Seaside-Tests-Pharo-Email-pmm.1';
			package: 'Seaside-Tests-Pharo-Functional' with: 'Seaside-Tests-Pharo-Functional-pmm.14' ].
		
	spec for: #'pharo' do: [
		spec 
			project: 'Grease Slime' with: '1.1.0';
			project: 'Grease Slime Tests' with: '1.1.0'.
		spec 
			package: 'Seaside-Slime' with: 'Seaside-Slime-lr.82';
			package: 'Seaside-Tests-Slime' with: 'Seaside-Tests-Slime-lr.42' ].

	spec for: #'pharo1.0.x' do: [
		spec 
			package: 'Seaside-Slime' with: 'Seaside-Slime-jok.80' ].