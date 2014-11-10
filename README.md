## INSTALL Preview Version

###GemStone
GsUpgrader works on all versions of GemStone against all Versions of GLASS:

```Smalltalk
Gofer new
  package: 'GsUpgrader-Core';
  url: 'http://ss3.gemtalksystems.com/ss/gsUpgrader';
  load.
(Smalltalk at: #GsUpgrader) upgradeMetacello.
```

###Pharo3.0
Metacello Preview  is pre-installed in Pharo3.0 the following installs the latest released version:

```Smalltalk
Metacello new
  baseline: 'Metacello';
  repository: 'github://dalehenrich/metacello-work:master/repository';
  get.
Metacello new
  baseline: 'Metacello';
  repository: 'github://dalehenrich/metacello-work:master/repository';
  onConflict: [:ex | ex allow];
  load
```

###Pharo (older than Pharo3.0)

```Smalltalk
"Get the Metacello configuration"
Gofer new
  gemsource: 'metacello';
  package: 'ConfigurationOfMetacello';
  load.
"Bootstrap Metacello Preview, using mcz files (#'previewBootstrap' symbolic version"
((Smalltalk at: #ConfigurationOfMetacello) project 
  version: #'previewBootstrap') load.

"Load the Preview version of Metacello from GitHub"
(Smalltalk at: #Metacello) new
  configuration: 'MetacelloPreview';
  version: #stable;
  repository: 'github://dalehenrich/metacello-work:configuration';
  load.
"Now load latest version of Metacello"
Metacello new
  baseline: 'Metacello';
  repository: 'github://dalehenrich/metacello-work:master/repository';
  get.
Metacello new
  baseline: 'Metacello';
  repository: 'github://dalehenrich/metacello-work:master/repository';
  onConflict: [:ex | ex allow];
  load
```

###Squeak

```Smalltalk
"Get the Metacello configuration (for Squeak users)"
Installer gemsource
    project: 'metacello';
    addPackage: 'ConfigurationOfMetacello';
    install.

"Bootstrap Metacello Preview, using mcz files (#'previewBootstrap' symbolic version"
((Smalltalk at: #ConfigurationOfMetacello) project 
  version: #'previewBootstrap') load.

"Load the Preview version of Metacello from GitHub"
(Smalltalk at: #Metacello) new
  configuration: 'MetacelloPreview';
  version: #stable;
  repository: 'github://dalehenrich/metacello-work:configuration';
  load.
"Now load latest version of Metacello"
Metacello new
  baseline: 'Metacello';
  repository: 'github://dalehenrich/metacello-work:master/repository';
  get.
Metacello new
  baseline: 'Metacello';
  repository: 'github://dalehenrich/metacello-work:master/repository';
  onConflict: [:ex | ex allow];
  load
```


See the [.travis.yml file](./.travis.yml) for list of supported platforms and versions.

If you are interested in using GitHub with the Metacello Preview, you should check out 
[Getting Started with GitHub][1], the [Metacello User Guide][2], the [Metacello Scripting API][3], and [Issue #136 detail][4].

###TravisCI Status
**master branch**: [![Build Status](https://secure.travis-ci.org/dalehenrich/metacello-work.png?branch=master)](http://travis-ci.org/dalehenrich/metacello-work)

**configuration branch**: [![Build Status](https://secure.travis-ci.org/dalehenrich/metacello-work.png?branch=configuration)](http://travis-ci.org/dalehenrich/metacello-work)

[1]: docs/GettingStartedWithGitHub.md
[2]: docs/MetacelloUserGuide.md
[3]: docs/MetacelloScriptingAPI.md
[4]: docs/Issue_136Detail.md


