versions-31
version310rss: spec
	<version: '3.1.0-rss' imports: #('3.1.0-rss-baseline' )>

	spec for: #'common' do: [
		spec 
			package: 'RSS-Core' with: 'RSS-Core-pmm.68';
			package: 'RSS-Examples' with: 'RSS-Examples-lr.26';
			package: 'RSS-Tests-Core' with: 'RSS-Tests-Core-lr.30' ]
