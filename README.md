## INSTALL Preview Version

```Smalltalk
"Get the Metacello configuration (for Pharo users)"
Gofer new
  gemsource: 'metacello';
  package: 'ConfigurationOfMetacello';
  load.

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
```

**GemStone2.4**, **PharoCore 1.3**, **PharoCore 1.4**, **Squeak4.3**, **Squeak4.4** and **Squeak4.5** are currently supported.

If you are interested in using GitHub with the Metacello Preview, you should check out 
[Getting Started with GitHub][1], the [Metacello User Guide][2], the [Metacello Scripting API][3], and [Issue #136 detail][4].

###TravisCI Status
**master branch**: [![Build Status](https://secure.travis-ci.org/dalehenrich/metacello-work.png?branch=master)](http://travis-ci.org/dalehenrich/metacello-work)

**configuration branch**: [![Build Status](https://secure.travis-ci.org/dalehenrich/metacello-work.png?branch=configuration)](http://travis-ci.org/dalehenrich/metacello-work)

**1.0-beta.31.1.5 branch**: [![Build Status](https://secure.travis-ci.org/dalehenrich/metacello-work.png?branch=1.0-beta.31.1.5)](http://travis-ci.org/dalehenrich/metacello-work)

[1]: https://github.com/dalehenrich/metacello-work/blob/master/docs/GettingStartedWithGitHub.md
[2]: https://github.com/dalehenrich/metacello-work/blob/master/docs/MetacelloUserGuide.md
[3]: https://github.com/dalehenrich/metacello-work/blob/master/docs/MetacelloScriptingAPI.md
[4]: https://github.com/dalehenrich/metacello-work/blob/master/docs/Issue_136Detail.md
