# Metacello Documentation

* Installation
* Using the Metacello Scripting API
* Specifying Configurations
* Help

## Installation

Install the **Metacello Preview** in your [Pharo1.3][1] or [Squeak4.3 image][2]:

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

## Using the Metacello Scripting API

* Loading
* Upgrading
* Locking
* Linking
* Fetching
* Recording
* Validating
* Finding
* Listing

### Loading

```Smalltalk
Metacello new
  configuration: 'Seaside30';
  load.
```

### Upgrading

```Smalltalk
Metacello new
  project: 'Seaside30';
  upgrade.
```

### Locking

```Smalltalk
Metacello new
  project: 'Seaside30';
  version: '3.0.7';
  lock.
```

### Linking (Registering)

```Smalltalk
Metacello new
  project: 'Seaside30';
  repository: 'filetree:///opt/git/Seaside30/repository';
  link.
```

### Fetching

```Smalltalk
Metacello new
  project: 'Seaside30';
  fetch.
```

### Recording

```Smalltalk
Metacello new
  project: 'Seaside30';
  record.
```

## Finding

```Smalltalk
Metacello new
  project: 'Seaside30';
  find.
```

### Listing

```Smalltalk
Metacello list.
```

### Project Specs
####project:
####configuration:
####baseline:
####version:
####repository:
##### Repository descriptions
##### Repository Shortcuts

* blueplane:
* croquet:
* gemsource:
* impara:
* renggli:
* saltypickle:
* squeakfoundation:
* squeaksource:
* wiresong:

### Options
####ignoreImage
####onUpgrade:
####onDowngrade:
####onConflict:
####silently
## Specifying Configurations

### ConfigurationOf
### BaselineOf

## Help

[1]: http://www.pharo-project.org/pharo-download/release-1-3
[2]: http://www.squeak.org/Download/
