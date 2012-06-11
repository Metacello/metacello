versions
version10beta32: spec
    <version: '1.0-beta.32' imports: #('1.0-beta.32-baseline')>
    spec
        for: #'common'
        do: [ 
            spec blessing: #'development'.
            spec
                description:
                    '1.0-beta.31.2 (dkh.649):
- fix Issue 163: MetacellMCProjectSpec>>ensureProjectLoaded doesn''t honor cacheRepository: or overrideRepository:
  http://code.google.com/p/metacello/issues/detail?id=163
1.0-beta.31.2 (dkh.650):
- clean up logging for Issue 163
1.0-beta.31.2 (dkh.651):
- more logging clean up
1.0-beta.31.2 (dkh.652):
- during ensured configuration loads, need to clear more of the cache.
1.0-beta.31.2 (dkh.653):
- when loading a new version of a config, ALL references to the project need to be nuked.
1.0-beta.31.2 (dkh.654):
- cached packages should only be loaded during an ensureLoad.
1.0-beta.31.2 (dkh.655):
- fix Issue 150: #stable version shouldn''t cause upgrade from project reference
  http://code.google.com/p/metacello/issues/detail?id=150
1.0-beta.32 (dkh.658):
- fixed Issue 5: Should throw error when group name shadows a project or package name
  http://code.google.com/p/metacello/issues/detail?id=5\
1.0-beta.32 (dkh.659):
- fix Issue 168: Metacello doesn''t use local mczs during bootstrap
  http://code.google.com/p/metacello/issues/detail?id=168
1.0-beta.32 (dkh.661):
- Squeak portability (Symbols with embedded $_)
1.0-beta.32 (dkh.662):
- fix Issue 111: progress notification for Squeak
  http://code.google.com/p/metacello/issues/detail?id=111
1.0-beta.32 (dkh.665):
- fix Issue 109:	pkgSpec for Metacello configuration doesn''t work for GemStone ServerDirectory repository
  http://code.google.com/p/metacello/issues/detail?id=109
1.0-beta.32 (dkh.666):
- fix Issue 109:	pkgSpec for Metacello configuration doesn''t work for GemStone ServerDirectory repository
  http://code.google.com/p/metacello/issues/detail?id=109
[pharo/squeak tests]
1.0-beta.32 (dkh.667):
- clean up usage of MCRepository>>asRepositorySpecFor: in MetacelloMCProject>>projectPackge
1.0-beta.32 (dkh.668):
- Issue 119:  leading trailing spaces in spec names should be flagged as input errors
  http://code.google.com/p/metacello/issues/detail?id=119
- Since Issue 119 involves throwing a creation-time error, I needed to solve the general problem of what to do when errros occur during version creation. Errors that occur during project construction no longer cause a halt to the proceedings. Project construction proceeds, however, the version with the error is (obviously) not available for use. If on accesses such a version, a MetacelloVersionDefinitionError (a kindOf: MetacelloVersionDoesNotExistError) that is thrown. If you wrap project creation with the following exception handler:
  [ConfigurationOfExample project ] 
	on: MetacelloErrorInProjectConstructionNotification 
	do: [:ex | ex resume: true ].
  the Error is thrown immediately.
- There is also a new error reasonCode (#''versionCreationError'') to flag these errors for the validator.
1.0-beta.32 (dkh.669):
- additional test case for Issue 119
1.0-beta.32 (dkh.670):
- fix Issue 165: Can be tricky to get custom attributes defined
  http://code.google.com/p/metacello/issues/detail?id=165
1.0-beta.32 (dkh.671):
- resurrecting spec tests from Metacello-Tests-dkh.225. The spec tests hadn''t been updated during the major refactoring that went on with the help of Doru to create the ConfigurationOfXXX as we know today, so they have been left behind (around Fall of 2009) ... now is as good a time as ever to resurrect the tests so we have tests for the basic functionality of the spec classes including MetacelloMemberspec and metacello memberListSpec ...
1.0-beta.32 (dkh.672):
- completed full set of tests for MetacelloSpecs ,,, coverage for accessing api, mergeSpec:, and add/copy/merge/remove for package and repository lists
1.0-beta.32 (dkh.673):
- Issue 149: MetacelloProjectSpecLoadError: No version found for #stable of ConfigurationOfProfStef
  http://code.google.com/p/metacello/issues/detail?id=149
1.0-beta.32 (dkh.674):
- optional className: for Issue 154: about blessing: and others
  http://code.google.com/p/metacello/issues/detail?id=154
- start on Issue 160: MetacelloAbstractVersionConstructor comments needed!
  http://code.google.com/p/metacello/issues/detail?id=160
- fix Issue 171: Critical Warning for missing versionString in baseline project reference
  http://code.google.com/p/metacello/issues/detail?id=171
1.0-beta.32 (dkh.675):
- comments for MetacelloAbstractVersionConstructor
- support for filetree:// repositories
- beginning of work to make className: optional in project reference spec (failing tests in MetacelloIssue154TestCase still need to be fixed)'.
            spec author: 'dkh'.
            spec timestamp: '6/11/2012 09:33'.
            spec
                project: 'FileTree' with: '1.0';
                project: 'Gofer' with: '1.0.5.1';
                project: 'Gofer Tests' with: '1.0.5.1'.
            spec
                package: 'Metacello-Base' with: 'Metacello-Base-dkh.58';
                package: 'Metacello-Core' with: 'Metacello-Core-dkh.578';
                package: 'Metacello-FileTree' with: 'Metacello-FileTree-dkh.28';
                package: 'Metacello-GitHub' with: 'Metacello-GitHub-dkh.9';
                package: 'Metacello-MC' with: 'Metacello-MC-dkh.619';
                package: 'Metacello-Reference' with: 'Metacello-Reference-dkh.33';
                package: 'Metacello-Tutorial' with: 'Metacello-Tutorial-dkh.25';
                package: 'OB-Metacello' with: 'OB-Metacello-dkh.82';
                package: 'Metacello-TestsReference' with: 'Metacello-TestsReference-DaleHenrichs.17';
                package: 'Metacello-TestsCore' with: 'Metacello-TestsCore-dkh.16';
                package: 'Metacello-TestsMC' with: 'Metacello-TestsMC-dkh.169';
                package: 'Metacello-TestsTutorial' with: 'Metacello-TestsTutorial-dkh.32';
                package: 'Metacello-ToolBox' with: 'Metacello-ToolBox-dkh.114' ].
    spec
        for: #'gemstone'
        do: [ 
            spec
                project: 'OmniBrowser' with: #'stable';
                project: 'Monticello' with: '0.242'.
            spec
                package: 'Metacello-MC' with: [ spec preLoadDoIt: #'gemstone10beta24PreLoadDoIt' ];
                package: 'Metacello-TestsPlatform' with: 'Metacello-TestsPlatform.gemstone-dkh.4';
                package: 'Metacello-Platform' with: 'Metacello-Platform.gemstone-dkh.24' ].
    spec
        for: #'squeakCommon'
        do: [ 
            spec
                project: 'OSProcess' with: #'stable';
                project: 'OmniBrowser' with: #'stable';
                project: 'HelpSystem' with: '1.1'.
            spec
                package: 'Metacello-TestsPlatform' with: 'Metacello-TestsPlatform.squeakCommon-dkh.5';
                package: 'Metacello-Help' with: 'Metacello-Help-dkh.11' ].
    spec
        for: #'pharo'
        do: [ 
            spec project: 'ProfStef' with: #'stable'.
            spec
                package: 'Metacello-ProfStef' with: 'Metacello-ProfStef-DaleHenrichs.10';
                package: 'Metacello-TestsProfStef' with: 'Metacello-TestsProfStef-DaleHenrichs.1';
                package: 'Metacello-Platform' with: 'Metacello-Platform.pharo-dkh.27' ].
    spec for: #'pharo1.2.x' do: [ spec package: 'Metacello-Issue3758' with: 'Metacello-Issue3758-dkh.2' ].
    spec for: #'pharo1.3.x' do: [ spec package: 'Metacello-Issue3758' with: 'Metacello-Issue3758-dkh.2' ].
    spec for: #'squeak' do: [ spec package: 'Metacello-Platform' with: 'Metacello-Platform.squeak-dkh.11' ]