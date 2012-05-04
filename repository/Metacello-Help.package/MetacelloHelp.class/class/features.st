pages
features
	^HelpTopic 	
		title: 'Features'
		contents: 'Metacello is consistent with the following features of a package management system.
		
DECLARATIVE MODELING
A Metacello project has named versions consisting of lists of explicit Monticello package versions. Dependencies are explicitly expressed in terms of named versions of required projects. A required project is a reference to another Metacello project.

DISTRIBUTED REPOSITORIES
Metacello project metadata is represented as instance methods in a class therefore the Metacello project metadata is stored in a Monticello package. As a result, it is easy for distributed groups of developers to collaborate on ad hoc projects.

OPTIMISTIC DEVELOPMENT
With Monticello-based packages, concurrent updates to the project metadata can be easily managed. Parallel versions of the metadata can be merged just like parallel versions of the code base itself.
	

Additionally, the following three points are important considerations for Metacello:

CROSS PLATFORM OPERATION
Metacello must run on all platforms that support Monticello: currently Squeak, Pharo and GLASS.

CONDITIONAL MONTICELLO PACKAGE LOADING
For projects that are expected to run on multiple platforms, it is essential that platform-specific Monticello packages can be conditionally loaded. At the moment, conditional loading is specified based upon the following attributes:

#common - Code that is common across all platforms.
#squeakCommon - Code that is common to Squeak and Pharo.
#squeak - Code that is specific to Squeak.
#pharo - Code that is specific to Pharo.
#gemstone - Code that is specific to GemStone.

It should be possible to inject project-specific attributes, so code that is dependent upon attributes not covered by the standard list can be conditionally loaded. For example, in GLASS, different Monticello package versions are loaded based on which version of GemStone/S is running (i.e., version 2.0 versus 3.0).

COMPATIBLE WITH MC2
It must be possible to manage Metacello projects that are based on alternate Distributed Source Code Management systems like Monticello2.

MIT LICENSED
		
		
		
'