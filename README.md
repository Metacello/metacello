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

### Pharo6.1, Pharo7.0

```Smalltalk
Iceberg enableMetacelloIntegration: false.

Metacello new
    baseline: 'Metacello';
    repository: 'github://metacello/metacello:pharo-6.1_dev/repository';
    onConflict: [ :ex | ex allow ];
    load.
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

### Squeak5.2 (and newer)

```Smalltalk
Installer ensureRecentMetacello.
```

### Squeak (older than Squeak5.2)

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
[Getting Started with GitHub][1], the [Metacello User Guide][2], the [Metacello Scripting API][3], [Issue #136 detail][4], and [Metacello API Reference][8].

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
[8]: docs/APIReference.md

## Contribution

See [docs/Contribute.md](docs/Contribute.md).
