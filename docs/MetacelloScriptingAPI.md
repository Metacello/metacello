# Metacello Documentation

* [Installation](#installation)
* [Using the Metacello Scripting API](#using-the-metacello-scripting-api)
* [Specifying Configurations](#specifying-configurations)
* [Help](#help)

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

* [Loading](#loading)
* [Upgrading](#upgrading)
* [Locking](#locking)
* [Linking](#linking)
* [Getting](#getting)
* [Fetching](#fetching)
* [Recording](#recording)
* [Finding](#finding)
* [Listing](#listing)

### Loading

```Smalltalk
Metacello new
  configuration: 'Seaside30';
  load.
```

```Smalltalk
Metacello new
  configuration: 'Seaside30';
  load: 'Base'.
```

```Smalltalk
Metacello new
  configuration: 'Seaside30';
  load: #('Base' 'Seaside-HTML5' 'Zinc-Seaside').
```
#### `load` notes

`github://`` projects are implicitly locked when loaded.

`filetree://` projects are implicitly locked when loaded
unless loaded as a project dependency.

### Upgrading

```Smalltalk
Metacello upgrade.
```

```Smalltalk
Metacello new
  configuration: 'Seaside30';
  upgrade.
```

### Locking

Locking prevents `upgrade` and `load` commands from automatically
upgrading a project when following project dependencies.

```Smalltalk
Metacello new
  configuration: 'Seaside30';
  version: '3.0.7';
  lock.
```

```Smalltalk
Metacello new
  configuration: 'Seaside30';
  lock.
```

```Smalltalk
Metacello new
  baseline: 'Seaside30';
  lock.
```

### Linking

```Smalltalk
Metacello new
  baseline: 'Seaside30';
  repository: 'filetree:///opt/git/Seaside30/repository';
  link.
```

### Getting

```Smalltalk
Metacello new
  configuration: 'Seaside30';
  get.
```

### Fetching

```Smalltalk
Metacello new
  configuration: 'Seaside30';
  fetch.
```

### Recording

```Smalltalk
Metacello new
  configuration: 'Seaside30';
  record.
```

### Finding

```Smalltalk
Metacello new
  configuration: 'Seaside30';
  find.
```

### Listing

```Smalltalk
Metacello list.
```

### Project Specs
####configuration:
####baseline:
####project:
####className:
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
