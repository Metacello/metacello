## INSTALL Preview Version

### GemStone
GsUpgrader works on all versions of GemStone against all Versions of GLASS:

```Smalltalk
Gofer new
  package: 'GsUpgrader-Core';
  url: 'http://ss3.gemtalksystems.com/ss/gsUpgrader';
  load.
(Smalltalk at: #GsUpgrader) upgradeMetacello.
```

### Pharo3.0, Pharo4.0, and Pharo5.0
Metacello Preview  is pre-installed in Pharo3.0 the following installs the latest released version:

```Smalltalk
Metacello new
  baseline: 'Metacello';
  repository: 'github://Metacello/metacello:master/repository';
  get.
Metacello new
  baseline: 'Metacello';
  repository: 'github://Metacello/metacello:master/repository';
  onConflict: [:ex | ex allow];
  load
```

### Pharo4.0, Pharo5.0 (Tonel support)

[Tonel](https://github.com/pharo-vcs/tonel) is a code export format that can be use in order to manage projects with git. It is supported by default since Pharo6.1.

You can install a version able to handle repositories of the Tonel format in Pharo 4 and 5 with this script:

```Smalltalk
Metacello new
  baseline: 'Metacello';
  repository: 'github://Metacello/metacello:master/repository';
  get.
Metacello new
  baseline: 'Metacello';
  repository: 'github://Metacello/metacello:master/repository';
  onConflict: [:ex | ex allow];
  load.
Metacello new
  baseline: 'Metacello';
  repository: 'github://Metacello/metacello:master/repository';
  onConflict: [:ex | ex allow];
  load: 'TonelSupport'
```

### Pharo (older than Pharo3.0)

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
  repository: 'github://Metacello/metacello:configuration';
  load.
"Now load latest version of Metacello"
Metacello new
  baseline: 'Metacello';
  repository: 'github://Metacello/metacello:master/repository';
  get.
Metacello new
  baseline: 'Metacello';
  repository: 'github://Metacello/metacello:master/repository';
  onConflict: [:ex | ex allow];
  load
```

### Squeak

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
  repository: 'github://Metacello/metacello:configuration';
  load.

"Now load latest version of Metacello"
(Smalltalk at: #Metacello) new
  baseline: 'Metacello';
  repository: 'github://Metacello/metacello:master/repository';
  get.
(Smalltalk at: #Metacello) new
  baseline: 'Metacello';
  repository: 'github://Metacello/metacello:master/repository';
  load.
```


See the [.travis.yml file](./.travis.yml) for list of supported platforms and versions.

If you are interested in using GitHub with the Metacello Preview, you should read The excellent [chapter on Metacello in Deep Into Pharo][5], then check out 
[Getting Started with GitHub][1], the [Metacello User Guide][2], the [Metacello Scripting API][3], and [Issue #136 detail][4].

### TravisCI Status
**master branch**: [![Build Status](https://travis-ci.org/Metacello/metacello.svg?branch=master)](https://travis-ci.org/Metacello/metacello)

### Some things to ponder 
[Dear package managers: dependency resolution results should be in version control][6] ([twitter comment thread][7]).

Interesting problem - non-reproducable builds when using non-exact dependent project versions. Wanders into the territory that Metacello locks for local git clones addresses ... but being able to communicate to others in some fashion is an interesting idea. 

[1]: docs/GettingStartedWithGitHub.md
[2]: docs/MetacelloUserGuide.md
[3]: docs/MetacelloScriptingAPI.md
[4]: docs/Issue_136Detail.md
[5]: http://pharobooks.gforge.inria.fr/PharoByExampleTwo-Eng/latest/Metacello.pdf
[6]: https://blog.ometer.com/2017/01/10/dear-package-managers-dependency-resolution-results-should-be-in-version-control/
[7]: https://twitter.com/migueldeicaza/status/868450752347480064


