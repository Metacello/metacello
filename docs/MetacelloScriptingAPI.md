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
  configuration: 'Sample';
  squeaksource3: 'Sample';
  version: '0.9.0';
  load.
```

downloads the `ConfigurationOfSample` package from
`http://ss3.gemstone.com/ss/Sample` and 
proceeds to load the `default` group of `Sample 0.9.0` into your image.

The above expression is equivalent to the following old-style `Gofer-based`
expression:

```Smalltalk
Gofer new
  squeaksource3: 'Sample';
  package: 'ConfigurationOfSample';
  load.
((Smalltalk at: #ConfigurationOfSample) project version: '0.9.0') load.
``` 

#### defaults

Besides being a bit more compact, the Metacello scripting API uses a few
handy default values for the **version** and **repository** attributes.
The default **version** attribute is `#stable` and the default
**repository** attribute is [platform-dependent](#load-notes)

Applying the default values, the following expression:

```Smalltalk
Metacello new
  configuration: 'Sample';
  load.
```

is equivalent to (assuming the platform-specific default repository is `http:www.squeaksource.com/MetacelloRepository`):

```Smalltalk
Metacello new
  configuration: 'Sample';
  squeaksource3: 'Sample';
  version: #stable;
  load.
```

#### load options

Arguments to the **load** command may be used to specify which groups,
packages or dependent projects should be loaded instead of the
`default` group.

This command loads the `Core` group for the `#stable` version of `Sample`:

```Smalltalk
Metacello new
  configuration: 'Sample';
  load: 'Core'.
```

This command loads the `Core` group and the 'Sample-Tests' package
for the `#stable` version of `Sample`:

```Smalltalk
Metacello new
  configuration: 'Sample';
  load: #('Core' 'Sample-Tests').
```
#### load phases
The load operation is performed in two phases. 
##### fetch phase
In the first phase, all
  of the packages that are to be loaded into your image are fetched from their respective
  repositories and stashed in the Monticello `package-cache`. If there
  is an network error during the `fetch` phase, you can execute the
  load commeand again, and Metacello will not attempt to re-fetch any
  packages that are already present in the `package-cache`.

##### load phase
In the second phase the packages are loaded into your image.


#### load return value

The load command returns an instance of 
[MetacelloVersionLoadDirective](*metacelloversionloaddirective) 
which when printed, gives you a report of the packages loaded 
into your image.

The following expression:

```Smalltalk
Metacello new
  configuration: 'Sample';
  version: #stable;
  repository: 'github://dalehenrich/sample:configuration';
  load.
```

produces a `printString` of:

```
linear load : 
  explicit load : 0.8.0 [ConfigurationOfSample]
  linear load : 0.8.0 [ConfigurationOfSample]
    linear load : baseline [BaselineOfSample]
      load : Sample-Core-dkh.2
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

* See the [Options](#options) section for additional information.

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
  configuration: 'Sample';
  upgrade.
```

Or upgrade a project to a specific version:

```Smalltalk
Metacello new
  configuration: 'Sample';
  version: '0.9.1';
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
  configuration: 'Sample';
  version: '0.9.1';
  onUpgrade: [:ex | ex allow];
  upgrade.
```

Otherwise, project locks for dependent projects are honored by the
upgrade command. 

#### upgrade return value

Like the [load command](#loading), the upgrade command returns an instance of
[MetacelloVersionLoadDirective](*metacelloversionloaddirective)
which when printed, gives you a report of the packages loaded
into your image.

#### `upgrade` Notes

* [project locking](#locking) is respected for dependent projects.

* see the [Options](#options) section for additional information.

### Downgrading

The upgrade command can be used to `downgrade` the version of a
project:

```Smalltalk
Metacello new
  configuration: 'Sample';
  version: '0.8.0';
  upgrade.
```

If you want to ensure that all dependent projects are downgraded along
with the target project, you can write an [onDowngrade:](*ondowngrade)
clause:

```Smalltalk
Metacello new
  configuration: 'Sample';
  version: '0.8.0';
  onDowngrade: [:ex | ex allow];
  upgrade.
```

Otherwise, dependent projects are not normally downgraded.

#### downgrade return value

Like the [upgrade command](#upgrading), the downgrade command returns an instance of
[MetacelloVersionLoadDirective](*metacelloversionloaddirective)
which when printed, gives you a report of the packages loaded
into your image.


### Locking

Automatically upgrading projects is not always desirable. Of course, 
in the normal course of loading and upgrading, you want the correct
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
  configuration: 'Sample';
  version: '0.9.0';
  lock.
```

Or you can specify a block to be evaluated against the `proposedVersion`
and answer `true` to allow limited upgrades:

```Smalltalk
Metacello new
  configuration: 'Sample';
  version: [:proposedVersion | 
    (propsedVersion versionNumberFrom: '0.8.0') <= proposedVersion 
      and: [ proposedVersion < (proposedVersion versionNumberFrom: '1.0.0') ]];
  lock.
```

If you don't specify an explicit version, then the currently loaded
version of the project is locked:

```Smalltalk
Metacello new
  configuration: 'Sample';
  lock.
```

If you are locking a [baseline configuration](#baselineof) it is not
necessary to specify a version:

```Smalltalk
Metacello new
  baseline: 'Sample';
  lock.
```

#### lock return value

The lock command returns an instance of the 
[MetacelloProjectRegistration](#metacelloprojectregistration)
class that when printed, displays the version and repository for the locked project.

The following expression:

```Smalltalk 
Metacello new
  configuration: 'Sample';
  lock.
```

produces:


```
ConfigurationOfSample stable from github://dalehenrich/sample:configuration
```

#### `lock` Notes

* To lock a git checkout for a project, you should lock the `baseline`:

    ```Smalltalk
    Metacello new
      baseline: 'Sample';
      lock.
    ```

### Unlocking

To unlock a project, use the `unlock:` command:

```Smalltalk
Metacello new
  project: 'Sample';
  unlock.
```

#### unlock return value

### Getting

If you are interested in looking at a configuration you may use the get command to load 
the configuration of a project into your image:

```Smalltalk
Metacello new
  configuration: 'Sample';
  get.
```

You can specify an explicit repository from which to get the configuration:

```Smalltalk
Metacello new
  configuration: 'Sample';
  squeaksource3: 'Sample';
  get.
```

#### get return value

### Fetching

The fetch command downloads all of the packages without loading them. Basically the 
fetch command performs the [first phase](#fetch-phase) of the [load command](#loading).

This command downloads all of the Sample packages into the local `package-cache` directory: 

```Smalltalk
Metacello new
  configuration: 'Sample';
  version: '0.8.0';
  fetch: 'ALL'.
```

You can specify a different repository to be used as the `cacheRepository`. 
The following command copies all of the Sample packages into the filetree repository in 
the directory `/opt/git/localSampleRepository`:

```Smalltalk
Metacello new
  configuration: 'Sample';
  version: '0.8.0';
  cacheRepository: 'filetree:///opt/git/localSampleRepository';
  fetch: 'ALL'.
```

If a project has dependent projects, then the packages for the dependent projects that 
would be loaded in the iamge are also copied.

The fetch command duplicates what the [load command](#loading) would
do, which means if a package is alrady loaded in the image, it will not be fetched.
To fetch packages regardless of what is loaded in the image, use the `ignoreImage` option:

```Smalltalk
Metacello new
  configuration: 'Sample';
  version: '0.8.0';
  cacheRepository: 'filetree:///opt/git/localSampleRepository';
  ignoreImage;
  fetch: 'ALL'.
```

If you have fetched your packages to a location on disk, you can use the following variant 
of the [load command](#loading) to load your project from the disk location:

```Smalltalk
Metacello new
  configuration: 'Sample';
  version: '0.8.0';
  cacheRepository: 'filetree:///opt/git/localSampleRepository';
  load: 'ALL'.
```

#### fetch return value

Like the [load command](#loading), the fetch command returns an instance of
[MetacelloVersionLoadDirective](*metacelloversionloaddirective)
which when printed, gives you a report of the packages fetched.

### Recording

```Smalltalk
Metacello new
  configuration: 'Sample';
  record.
```

#### record return value

### Finding

```Smalltalk
Metacello new
  configuration: 'Sample';
  find.
```

### Listing

```Smalltalk
Metacello new
  list.
```

#### list return value

### General Script Command Structure
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
* squeaksource3:
* squeaksource:
* wiresong:

#### Options
#####cacheRepository:
#####ignoreImage
#####onUpgrade:
#####onDowngrade:
#####onConflict:
#####silently
### Classes
#### MetacelloProjectRegistration
#### MetacelloProjectSpec
#### MetacelloVersionLoadDirective
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
