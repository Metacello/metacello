# Metacello Scripting API Documentation

The **Metacello Scripting API** provides a platform independent way for
loading Metacello configurations into your image.

Currently [Pharo1.3][1] and [Squeak4.3][2] are supported.

* [Installation](#installation)
* [Using the Metacello Scripting API](#using-the-metacello-scripting-api)
* [Best Practice](#best-practice)
* [Specifying Configurations](#specifying-configurations)
* [Metacello Version Numbers](*metacello-version-numbers)
* [Help](#help)

## Installation

To get started we need to load the `ConfigurationOfMetacello`. In a Pharo1.3 image:

```Smalltalk
"Get the Metacello configuration"
Gofer new
  gemsource: 'metacello';
  package: 'ConfigurationOfMetacello';
  load.
```

or a Squeak4.3 image:

```Smalltalk
Installer gemsource
    project: 'metacello';
    install: 'ConfigurationOfMetacello'. 
```

then bootstrap `Metacello 1.0-beta.32` and install the `Metacello Preview` code (both images):

```Smalltalk
((Smalltalk at: #ConfigurationOfMetacello) project 
  version: '1.0-beta.32') load.

(Smalltalk at: #Metacello) new
  configuration: 'MetacelloPreview';
  version: #stable;
  repository: 'github://dalehenrich/metacello-work:configuration';
  load.
```

*Once the Metacello Scripting API is released, the Metacello class
will be installed in the base images for GemStone, Pharo and Squeak and
bootstrapping will no longer be necessary.*

## Using the Metacello Scripting API

* [Loading](#loading)
* [Upgrading](#upgrading)
* [Downgrading](#downgrading)
* [Locking](#locking)
* [Unlocking](#unlocking)
* [Getting](#getting)
* [Fetching](#fetching)
* [Recording](#recording)
* [Finding](#finding)
* [Listing](#listing)

### Loading

Metacello loads the packages and dependencies (*required projects*) for a project
based on the specifications in the [configuration of a
project](#configurationof).

The statement: 

```Smalltalk
Metacello new
  configuration: 'Seaside30';
  squeaksource: 'MetacelloRepository';
  version: '3.0.7';
  load.
```

will download the `ConfigurationOfSeaside30` package from
`http:www.squeaksource.com/MetacelloRepository` and 
proceed to load the `default` group of `Seaside 3.0.7` into your image.

The above expression is equivalent to the following old-style `Gofer-based`
expression:

```Smalltalk
Gofer new
  squeaksource: 'MetacelloRepository';
  package: 'ConfigurationOfSeaside30';
  load.
((Smalltalk at: #ConfigurationOfSeaside30) project version: '3.0.7') load.
``` 

Besides being a bit more compact, the Metacello scripting API uses a few
handy default values for the **version** and **repository** attributes.
The default **version** attribute is `#stable` and the default
**repository** attribute is [platform-dependent](#load-notes)

Applying the default values, the following expression:

```Smalltalk
Metacello new
  configuration: 'Seaside30';
  load.
```

is equivalent to (assuming the platform-specific default repository is `http:www.squeaksource.com/MetacelloRepository`):

```Smalltalk
Metacello new
  configuration: 'Seaside30';
  squeaksource: 'MetacelloRepository';
  version: #stable;
  load.
```

Arguments to the **load** command may be used to specify which groups,
packages or dependent projects should be loaded instead of the
`default` group.

This command loads the `Base` group for the `#stable` version of `Seaside30`:

```Smalltalk
Metacello new
  configuration: 'Seaside30';
  load: 'Base'.
```

This command loads the `Base` group, the `Seaside-HTML5` package, 
and the `Zinc-Seaside` package for the `#stable` version of `Seaside30`:

```Smalltalk
Metacello new
  configuration: 'Seaside30';
  load: #('Base' 'Seaside-HTML5' 'Zinc-Seaside').
```

#### `load` Notes

* If a configuration is already present in the image when the load command
is executed, the existing configuration is used. Use the [get](#getting)
command to refresh the configuration.

* The default repository is platform-dependent. See the documentation
  for your platform to determine which repository is used. 
  Currently `http:www.squeaksource.com/MetacelloRepository` is used as the default.

* `github://` projects are implicitly [locked](#locking) when loaded.

* `filetree://` projects are implicitly [locked](#locking) when loaded
unless loaded as a project dependency.

* see the [Options](#options) section for additional information.

### Upgrading

When you come back to an image that you've left dormant for awhile, it
can be a real pain to upgrade all of the loaded projects to the latest
version. With Metacello you can upgrade all of the projects with one
command:

```Smalltalk
Metacello upgrade.
```

The `upgrade` command iterates over all loaded projects; refreshes
the project configuration and loads the `#stable` version of each project.

You can also selectively upgrade an individual project:

```Smalltalk
Metacello new
  configuration: 'Seaside30';
  upgrade.
```

Or upgrade a project to a specific version:

```Smalltalk
Metacello new
  configuration: 'Seaside30';
  version: '3.0.8';
  upgrade.
```

In this case the project configuration is refreshed and the specified
version is loaded. If the project was previously [locked](*locking), the
lock is changed to reflect the new version of the project.

If you want to ensure that all dependent projects are upgraded along
with the target project, you can write an [onUpgrade:](*onupgrade)
clause:

```Smalltalk
Metacello new
  configuration: 'Seaside30';
  version: '3.0.8';
  onUpgrade: [:ex | ex allow];
  upgrade.
```

Otherwise, project locks for dependent projects are honored by the
upgrade command. 

#### `upgrade` Notes

* [project locking](#locking) is respected for dependent projects.

* see the [Options](#options) section for additional information.

#### Downgrading

The upgrade command can be used to `downgrade` the version of a
project:

```Smalltalk
Metacello new
  configuration: 'Seaside30';
  version: '3.0.0';
  upgrade.
```

If you want to ensure that all dependent projects are downgraded along
with the target project, you can write an [onDowngrade:](*ondowngrade)
clause:

```Smalltalk
Metacello new
  configuration: 'Seaside30';
  version: '3.0.0';
  onDowngrade: [:ex | ex allow];
  upgrade.
```

Otherwise, dependent projects are not normally downgraded.

### Locking

Automatically upgrading projects is not always desirable. Of course, 
in the normal course of loading and upgrading, you will want the correct
version of dependent projects loaded. However under the following
conditions:

* Your application may depend upon a specific version (or 
  range of versions) for a project.
* You may be actively developing a particular version of a 
  project and you don't want the
  project upgraded (or downgraded) out from under you.
* You may be working with a git checkout of a project and you want to
  continue using the git checkout.

you many not want to have particular projects upgraded automatically.
The `lock` command gives you control.

You can lock a project to a particular version:

```Smalltalk
Metacello new
  configuration: 'Seaside30';
  version: '3.0.7';
  lock.
```

Or you can specify a block to be evaluated against the `proposedVersion`
and answer `true` to allow limited upgrades:

```Smalltalk
Metacello new
  configuration: 'Seaside30';
  version: [:proposedVersion | 
    (propsedVersion versionNumberFrom: '3.0.7') <= proposedVersion 
      and: [ proposedVersion < (proposedVersion versionNumberFrom: '3.1.0') ]];
  lock.
```

If you don't specify an explicit version, then the currently loaded
version of the project is locked:

```Smalltalk
Metacello new
  configuration: 'Seaside30';
  lock.
```

If you are locking a [baseline configuration](#baselineof) it is not
necessary to specify a version:

```Smalltalk
Metacello new
  baseline: 'Seaside30';
  lock.
```

#### `lock` Notes

* To lock a git checkout for a project, you should lock the `baseline`:

    ```Smalltalk
    Metacello new
      baseline: 'Seaside30';
      lock.
    ```

### Unlocking

```Smalltalk
Metacello new
  baseline: 'Seaside30';
  unlock.
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
## Best Practice
### Use #development and #release blessings
#### Semantic Versioning
### Validate configuration before commit
### GitHub project structure
## Specifying Configurations

### ConfigurationOf
### BaselineOf

## Metacello Version Numbers
## Help

[1]: http://www.pharo-project.org/pharo-download/release-1-3
[2]: http://www.squeak.org/Download/