[![Build Status](https://secure.travis-ci.org/dalehenrich/metacello-work.png)](http://travis-ci.org/dalehenrich/metacello-work)

Both **PharoCore 1.3** and **Squeak4.3** are currently supported.

## INSTALL 

*These instructions assume that no version of Metacello has been loaded
into your image.*

### Clone the metacello repository (Pharo and Squeak):

```shell
  sudo mkdir /opt/git/
  sudo chmod og+rw /opt/git/
  cd /opt/git/
  git clone https://github.com/dalehenrich/metacello-work
```

### Clone the filetree repository and bootstrap Metacello (PharoCore1.3):

```shell
  sudo mkdir /opt/git/
  sudo chmod og+rw /opt/git/
  cd /opt/git/
  git clone -b pharo1.3 https://github.com/dalehenrich/filetree.git
```

```Smalltalk
Gofer new
  gemsource: 'metacello';
  package: 'Metacello-Base';
  load.
```

#### Clone the filetree repository and bootstrap Metacello (Squeak4.3):

```shell
  sudo mkdir /opt/git/
  sudo chmod og+rw /opt/git/
  cd /opt/git/
  git clone -b squeak.3 https://github.com/dalehenrich/filetree.git
```

```Smalltalk
Installer  gemsource
    project: 'metacello';
    install: 'Metacello-Base'. 
```

### Trigger the full Install

```Smalltalk
| gitPath |
gitPath := '/opt/git/'.

Metacello new
  baseline: 'Metacello';
  repository: 'filetree://', gitPath, '/metacello-work/repository';
  load.
```

