## INSTALL Preview Version

```Smalltalk
"Get the Metacello configuration"
Gofer new
  gemsource: 'metacello';
  package: 'ConfigurationOfMetacello';
  load.

"Bootstrap Metacello 1.0-beta.32, using mcz files"
((Smalltalk at: #ConfigurationOfMetacello) project 
  version: '1.0-beta.32') load.

"Load the Preview version of Metacello from GitHub"
(Smalltalk at: #Metacello) new
  configuration: 'MetacelloPreview';
  version: #stable;
  repository: 'github://dalehenrich/metacello-work:configuration';
  load.
```

**GemStone2.4**, **PharoCore 1.3**, **PharoCore 1.4** and **Squeak4.3** are currently supported.

If you are interested in using GitHub with the Metacello Preview, you should check out 
[Getting Started with GitHub][1], the [Metacello User Guide][2], and the [Metacello Scripting API][3].

###TravisCI Status
**master branch**: [![Build Status](https://secure.travis-ci.org/dalehenrich/metacello-work.png?branch=master)](http://travis-ci.org/dalehenrich/metacello-work)

**configuration branch**: [![Build Status](https://secure.travis-ci.org/dalehenrich/metacello-work.png?branch=configuration)](http://travis-ci.org/dalehenrich/metacello-work)

**1.0-beta.31.1.5 branch**: [![Build Status](https://secure.travis-ci.org/dalehenrich/metacello-work.png?branch=1.0-beta.31.1.5)](http://travis-ci.org/dalehenrich/metacello-work)

[1]: https://github.com/dalehenrich/metacello-work/blob/master/docs/GettingStartedWithGitHub.md
[2]: https://github.com/dalehenrich/metacello-work/blob/master/docs/MetacelloUserGuide.md
[3]: https://github.com/dalehenrich/metacello-work/blob/master/docs/MetacelloScriptingAPI.md
