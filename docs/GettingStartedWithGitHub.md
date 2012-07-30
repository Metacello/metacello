# Getting Started with GitHub

Currently **GemStone2.4**, **PharoCore 1.3**, **PharoCore 1.4** and **Squeak4.3** are supported.

1. [Set up git][1].
2. [Create a GitHub repository][2].
3. [Create `filetree:` repository directory](#create-filetree-repository-direcotry)
4. [Install Metacello](#install-metacello)
5. [Attach to git repository](#attach-to-git-repository)
6. [Copy mcz files to git repository](#copy-mcz-files-to-git-repository)
7. [Create baseline](#create-baseline)
8. [Prime Metacello registry](#prime-metacello-registry)
9. [Saving your work](#saving-your-work)
10. [Updating from git repository](#updating-from-git-repository)

## Create `filetree:` repository directory
Technically the [FileTree][3] repository can be located in the root of
your git checkout, but I like to provide some initial structure to the
repository so there is room for adding artifacts (like documentation) in
addition to the packages. 

I start my projects with the following artifacts:

```
+-Sample
  +-docs
  |  +-README.md
  +-repository
  +-README.md
```

The Monticello packages will be placed into the `repository` directory.

## Install Metacello

This installation of Metacello also installs FileTree.

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

For Squeak, you will want to use **Installer** to load the
*ConfigurationOfMetacello*.

## Attach to git repository

When you install FileTree, a new repository type, *filetree:* is added
to the MonticelloBrowser menu. Selecting the *filetree:* menu item will
bring up a directory selector. Select the directory in your git
repository where you want the packages installed.

If you prefer you can execute the following:

```Smalltalk
| pathToPackageDirectory packageDirectory repo |
"edit to match the path to your chosen package directory"
pathToPackageDirectory := '/opt/git/Sample/repository'.
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

## Copy mcz files to git repository

If you have an existing project then you will want to copy your
existing packages into the FileTree repository. 

If you have an existing configuration, you can use the following
expression to copy the packages from your existing repository to your
new FileTree repository:

```Smalltalk
| pathToPackageDirectory version |
"edit to match the path to your chosen package directory"
pathToPackageDirectory := '/opt/git/Sample/repository'.
"edit to match the version of your project you want to use as your starting point"
version := '1.0'.
Metacello new
  configuration: 'Sample';
  version: version;
  cacheRepository: 'filetree://', pathToPackageDirectory;
  ignoreImage;
  fetch: 'ALL'.
```

## Create baseline
## Prime Metacello registry
## Saving your work
## Updating from git repository

[1]: https://help.github.com/articles/set-up-git
[2]: https://help.github.com/articles/create-a-repo
[3]: https://github.com/dalehenrich/filetree
