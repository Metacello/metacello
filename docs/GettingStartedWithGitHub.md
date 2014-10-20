# Getting Started with GitHub

Currently **GemStone2.4**, **PharoCore 1.3**, **PharoCore 1.4** and **Squeak4.3** are supported.

1. [Set up git][1].
2. [Create a GitHub repository][2].
3. [Create `filetree:` packages directory](#create-filetree-packages-direcotry)
4. [Install Metacello](#install-metacello)
5. [Attach to git repository](#attach-to-git-repository)
7. [Create baseline](#create-baseline)
8. [Prime Metacello registry](#prime-metacello-registry)
9. [Saving your work](#saving-your-work)
11. [Create configuration](#create-configuration)
12. [Git workflow](#git-workflow)

## Create `filetree:` packages directory
Technically the [FileTree][3] packages repository can be located in the root of
your git checkout, but I like to provide some initial structure to the
git repository so there is room for adding artifacts (like documentation) in
addition to the packages.

I start my projects with the following files and directories:

```
+-Sample
  +-docs
  |  +-README.md
  +-license.txt
  +-packages
  +-README.md
```

I put the Monticello packages in the `packages` directory.

## Install Metacello

These expressions install the Metacello Preview and [FileTree][3].

```Smalltalk
"Get the Metacello configuration"
Gofer new
  url: 'http://seaside.gemtalksystems.com/ss/metacello/';
  package: 'ConfigurationOfMetacello';
  load.

"Bootstrap Metacello Preview, using mcz files (#'previewBootstrap' symbolic version)"
((Smalltalk at: #ConfigurationOfMetacello) project 
  version: #'previewBootstrap') load.

"Load the Preview version of Metacello from GitHub"
(Smalltalk at: #Metacello) new
  configuration: 'MetacelloPreview';
  version: #stable;
  repository: 'github://dalehenrich/metacello-work:configuration';
  load.
```

For Squeak, you will want to use **Installer** to load the
*ConfigurationOfMetacello*.

## Attach to git repository

When you install FileTree, a new Monticello repository type, *filetree:* is added
to the MonticelloBrowser menu. Selecting the *filetree:* menu item will
bring up a directory selector. Select the directory in your git
repository where you want the packages installed.

If you prefer you can execute the following:

```Smalltalk
| pathToPackageDirectory packageDirectory repo |
"edit to match the path to your chosen package directory"
pathToPackageDirectory := '/opt/git/Sample/packages'.
packageDirectory := FileDirectory on: pathToPackageDirectory.
"create a FileTree repository"
repo := MCFileTreeRepository new
    directory: packageDirectory.
"add repo to default repositories"
MCRepositoryGroup default addRepository: repo.
^repo
```

**MCFileTreeRepository** can be used anywhere that *normal* Monticello
repositories can be used. I.e., you can copy packages into and out of an **MCFileTreeRepository** repository like any other repository.

## Create baseline

During development phase of a project using a FileTree repository, you
only need to create a baseline for your project.

Start by creating a subclass of **BaselineOf**:

```Smalltalk
BaselineOf subclass: #BaselineOfSample
  instanceVariableNames: ''
  classVariableNames: ''
  poolDictionaries: ''
  category: 'BaselineOfSample'
```

Next, you need to create a **baseline:** method.

If you've already got a
configuration created for your project, you can
use one of your **baselineXXX:** methods as a starting point and make the following edits:

* make sure that the **versionString:** for each project is pointing at
  an explicit version.
* remove the **repository:** statement. The *baseline* references the
  repository that it is loaded from.

If you don't have a configuration, here is a sample *baseline*:

```Smalltalk
baseline: spec
  <baseline>

  spec for: #common do: [
    spec configuration: 'Seaside30' with: [
      spec
        version: #stable;
        repository: 'http://www.squeaksource.com/MetacelloRepository' ].
    spec
      package: 'Sample-Core'with: [
        spec requires: 'Seaside30' ];
      package: 'Sample-Tests' with: [
        spec requires: 'Sample-Core' ]].
```

For more information about creating Metacello configurations, see the
[Metacello chapter][4] of [Pharo by Example][5].

After you've created the **BaselineOf**, save it into
your project repository.

## Prime Metacello registry

You must do at least one fully-specified load of a project to make sure
that the project is correctly registered in the *Metacello Project
Registry*:

```Smalltalk
| pathToPackageDirectory packageDirectory repo |
"edit to match the path to your chosen package directory"
pathToPackageDirectory := '/opt/git/Sample/packages'.
Metacello new
  baseline: 'Sample';
  repository: 'filetree://', pathToPackageDirectory;
  load.
```

Once you've done the first load, you can execute the following
expressions to refresh the *baseline* and reload the project (useful if
you've done a git `checkout` or `pull`):

```Smalltalk
Metacello image
  baseline: 'Sample';
  get;
  load.
```

## Saving your work

When you've finished  a unit of work, you need to perform the following
steps to save your work to GitHub:

1. Monticello `commit` from the *MonticelloBrowser* for each of your
   dirty packages.
2. Git `commit` to save your work into your local git repository.
3. Git `push` to share the work with your GitHub repository.

Note that I do a git `commit` after every Monticello `commit`, but I don't always do a git `push` after every git `commit`. The `push` is only necessary when I'm ready to share my work with others.

## Create configuration

When you are ready to make a release of your project, you should create
a configuration.

Start by creating a subclass of **ConfigurationOf**:

```Smalltalk
ConfigurationOf subclass: #ConfigurationOfSample
  instanceVariableNames: ''
  classVariableNames: ''
  poolDictionaries: ''
  category: 'ConfigurationOfSample'
```

```Smalltalk
version100: spec
    <version: '1.0.0'>
    spec
        for: #'common'
        do: [
            spec blessing: #'release'.
            spec description: 'a lot of cool stuff'.
            spec author: 'dkh'.
            spec timestamp: '7/30/2012 15:52'.
            spec
                baseline: 'Sample' with: [ spec repository: 'github://dalehenrich/sample:cecd1626d27f67175f22e6075ca2d1177da1d525/packages' ];
                import: 'Sample' ]
```

Note that you should only use this approach if you are sharing your
configuration with folks who are participating in the Metacello Preview.

For more information on the `github://dalehenrich/sample:cecd1626d27f67175f22e6075ca2d1177da1d525/packages` description see the section on
[github://](MetacelloScriptingAPI.md#github) in the [Metacello Scripting API
reference](MetacelloScriptingAPI.md).

## Git workflow

For the most part I tend to follow the [GitHub Flow][6] model. It is
worth reading about [git-flow][7].

[1]: https://help.github.com/articles/set-up-git
[2]: https://help.github.com/articles/create-a-repo
[3]: https://github.com/dalehenrich/filetree
[4]: http://pharobooks.gforge.inria.fr/PharoByExampleTwo-Eng/latest/Metacello.pdf
[5]: http://pharobyexample.org/
[6]: http://scottchacon.com/2011/08/31/github-flow.html
[7]: http://nvie.com/posts/a-successful-git-branching-model/
