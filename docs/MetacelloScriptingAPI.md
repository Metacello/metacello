# Metacello Scripting API Documentation

The **Metacello Scripting API** provides a platform independent way for
loading Metacello configurations into your image.

Currently [Pharo-1.3][1], [Pharo-1.4][3], [Pharo-2.0][4], and [Squeak4.3][2] are supported.

* [Installation](#installation)
* [Using the Metacello Scripting API](#using-the-metacello-scripting-api)
* [Scripting API Referenece](#scripting-api-referenece)
* [Best Practice](#best-practice)
* [Specifying Configurations](#specifying-configurations)
* [Metacello Version Numbers](#metacello-version-numbers)
* [Help](#help)

## Installation
In Pharo 3.0, Metacello Scripting comes pre-installed. For other platforms...
##### To get started we need to load the `ConfigurationOfMetacello`. 

In an older Pharo image:

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

##### Then bootstrap `Metacello #'previewBootstrap'` and install the `Metacello Preview` code (both images):

```Smalltalk
((Smalltalk at: #ConfigurationOfMetacello) project 
  version: #'previewBootstrap') load.

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
* [Locking](#locking)
* [Unlocking](#unlocking)
* [Getting](#getting)
* [Fetching](#fetching)
* [Recording](#recording)
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
  load command again, and Metacello will not attempt to re-fetch any
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

* The default repository is platform-dependent. Evaluate the following Smalltalk expression
  to determine the default repository for your platform:

  ```Smalltalk
  MetacelloPlatform  current defaultRepositoryDescription
  ```

* `github://` projects are implicitly [locked](#locking) when loaded.

* `filetree://` projects are implicitly [locked](#locking) when loaded
unless loaded as a project dependency.

* See the [Options](#options) section for additional information.

### Locking

Automatically upgrading projects is not always desirable. Of course, 
in the normal course of loading and upgrading, you want the correct
version of dependent projects loaded. However under the following
conditions:

* You may be actively developing a particular version of a 
  project and you don't want the
  project upgraded (or downgraded) out from under you.
* You may be working with a git checkout of a project and you want to
  continue using the git checkout.

you may not want to have particular projects upgraded automatically.
The `lock` command gives you control.

You can lock a project to a particular version:

```Smalltalk
Metacello new
  configuration: 'Sample';
  version: '0.9.0';
  lock.
```

If you don't specify an explicit version, then the currently loaded
version of the project is locked:

```Smalltalk
Metacello image
  configuration: 'Sample';
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

You can obtain a list of `locked` projects in the registry:

```Smalltalk
Metacello registry
  locked.
```

To obtain a list of `locked` projects loaded in the image:

```Smalltalk
Metacello image
  locked.
```

The locked command returns a list of locked project specs.

#### `lock` Notes

* To lock a git checkout for a project, you should lock the `baseline`:

    ```Smalltalk
    Metacello new
      baseline: 'Sample';
      lock.
    ```
* Additional [documentation][5] and [an example locking project][6] are available
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

The record command performs the same function as the [fetch](*fetching)
command, without actually downloading any files. As a consequence, it
can give you a quick report of what packages will be loaded into your
image.

#### record return value

Like the [load](#loading) and [fetch](*fetch) commands, the record command returns an instance of
[MetacelloVersionLoadDirective](*metacelloversionloaddirective)
which when printed, gives you a report of the packages fetched.

Printing the following expression:

```Smalltalk
Metacello new
  configuration: 'Sample';
  record.
```

produces:

```
linear load : 
	linear load : 0.8.0 [ConfigurationOfSample]
		load : BaselineOfSample
	linear load : 0.8.0 [ConfigurationOfSample]
		linear load : baseline [BaselineOfSample]
			load : Sample-Core
```

### Listing

The list command may be used to list projects in a repository:

```Smalltalk
Metacello new
  configuration: [:spec | true ];
  repository: 'github://dalehenrich/sample:configuration';
  list.
```

or loaded in the image:

```Smalltalk
Metacello image
  configuration: [:spec | true ];
  list.
```

or registered with Metacello (i.e., projects that have been operated on by the [get](#getting) or [lock](#locking) commands:

```Smalltalk
Metacello registry
  configuration: [:spec | true ];
  list.
```

#### `list` return value

The list command returns a collection of instances of the [MetacelloProjectSpec](#metacelloprojectspec) class.

## Scripting API Referenece
###Project Specification
####configuration:
####baseline:
####project:
####className:
####version:
####repository:
##### Repository descriptions
The **Repository description** is a URL that is used to resolve the location of Metacello repositories.

The general form of the **description**:

```
  scheme://location
```

Where the *scheme* may be any one of the following:

 * [client](#client)
 * [dictionary](#dictionary)
 * [filetree](#filetree)
 * [ftp](#ftp)
 * [github](#github)
 * [http](#http)
 * [server](#server) 

The layout of the *location* is dependent upon the *scheme* being used.

##client://

```
  client:// <full directory path to Monticello repository>
```

##dictionary://

```
  dictionary:// <Global name of dictionary containing Monticello repository instance>
```

##filetree://

```
  filetree:// <full directory path to Filetree repository>
```

##ftp://

```
  ftp:// <ftp server host name> [: <port> ] </ path>
```

*NOTE: Squeak and Pharo only.*

##github://

```
  github:// <github user> / <github project>  [ : <version identifier> ] [ / <repository path> ]
```

*gitthub://* is the scheme identifier for the GitHub repository description.

*github user* is the user name or organization name of the owner of the GitHub proejct.

*github project* is the name of the GitHub project.

*version identifier* is the name of a *branch*, the name of a *tag* or the *SHA* of a commit. The *tag name* and *SHA*  
identifies a specific commit. The *branch name* resolves to the current HEAD of the branch. The **version identifier** is 
optional. 

*repository path* is the path to a subdirectory in the project where the repository is rooted. If absent the repository 
is rooted in the projects HOME directory.

##http://

```
  http:// <http server host name> [: <port> ] </ path to Monticello repository>
```

##server://

```
  server:// <full directory path to Monticello repository>
```

*NOTE: GemStone only.*


##### Repository Shortcuts

* blueplane:
* croquet:
* filetreeDirectory:
* gemsource:
* githubUser:project:commitish:path:
* impara:
* renggli:
* saltypickle:
* smalltalkhubUser:project:
* squeakfoundation:
* squeaksource3:
* squeaksource:
* wiresong:

### Options
####cacheRepository:
####ignoreImage
####onConflict:
####onConflictUseIncoming
####onConflictUseIncoming:useLoaded:
####onConflictUseLoaded
####onDowngrade:
####onDowngradeUseIncoming
####onDowngradeUseIncoming:
####onLock:
####onLockBreak
####onLockBreak:
####onUpgrade:
####onUpgradeUseLoaded
####onUpgradeUseLoaded:
####onWarning:
####onWarningLog
####silently
### Metacello Project Registry
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
[3]: http://www.pharo-project.org/pharo-download/release-1-4
[4]: http://www.pharo-project.org/pharo-download/release-2-0
[5]: MetacelloUserGuide.md#locking
[6]: LockCommandReference.md
