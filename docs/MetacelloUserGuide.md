# Metacello User Guide

In this guide we'll take a walk through a couple of common development
scenarios and highlight some of the features of the *Metacello Scripting
API*.

*For installation and more detailed documentation on the Metacello
Scripting API, see the [Metacello Scripting API Documentation][1].*

## Introduction

The number one job of the *Metacello Scripting API* is to simplify the
job of loading projects into your image. As you are probably all
too aware, today it's a two step process where you first load the
configuration into your image using [Gofer][2] and then load your
project using Metacello:

```Smalltalk
Gofer new
  package: 'ConfigurationOfSeaside3';
  smalltalkhubUser: 'Seaside' project: 'Seaside31';
  load.
((Smalltalk at: #ConfigurationOfSeaside3) version: #stable) load.
```

In the early days of Metacello (and Gofer) this was a great improvement
over the alternatives, but today, 3 years after the introduction of
Metacello, there should be a better way...and there is.
Using the *Metacello Scripting API* the above expression reduces to the
following:

```Smalltalk
Metacello new
  configuration: 'Seaside3';
  load.
```

## Loading

In this example of the [`load` command][5] we are leveraging a couple of
default values, namely the `version` of the project and the `repository` where the
**ConfigurationOfSeaside** package can be found:

```Smalltalk
Metacello new
  configuration: 'Seaside3';
  load.
```

Here is a variant
of the same expression with the default version explicitly specified (the default repository description varies depending upon the platform that you are running on):

```Smalltalk
Metacello new
  configuration: 'Seaside3';
  version: #stable;
  smalltalkhubUser: 'Seaside' project: 'Seaside31';
  load.
```

The `version` attribute can be any legal [version number][10].
`smalltalkhubUser:project:` is a [repository shortcut][4]. You can also specify the
full [repository description][3] as an URL:

```Smalltalk
Metacello new
  configuration: 'Seaside3';
  version: #stable;
  repository: 'http://smalltalkhub.com/mc/Seaside/Seaside31/main';
  load.
```

###Load Conflicts
Load conflicts occur if any one of the load attributes is changed when doing an *indirect* load of a project that has already been loaded into your image.

A *direct* load is a project load occurs when the project is named in the Metacello load expression.
In the following expression the version 3.1.1 of Seaside is *directly* loaded:

```Smalltalk
Metacello new
  configuration: 'Seaside3';
  version: '3.1.1';
  repository: 'http://smalltalkhub.com/mc/Seaside/Seaside31/main';
  load.
```

An *indirect* load is a project load that occurs as a result of a project dependency.
In the following expression a version (3.1.3 as of this writing) of Seaside is *indirectly* loaded:

```Smalltalk
Metacello new
  configuration: 'Magritte3';
  version: '3.1.4';
  repository: 'http://smalltalkhub.com/mc/Magritte/Magritte3/main';
  load: 'Seaside'.
```

Load attributes that count towards conflicts are:

* configuration versus baseline
* version
* repository

Version conflicts are divided into two categories: [upgrade](#upgrade) and [downgrade](#downgrade). 

####Upgrade
When a later version of an already loaded project is indirecty loaded, a **MetacelloAllowProjectUpgrade** exception is signaled.
By default, upgrades are allowed (`useIncoming`). 

If you want to override the default behavior you can use one the following messages:

1. Disallow the upgrade of the Seaside3 project with the **#disallowUpgrades:** message:

  ```Smalltalk
  Metacello new
    configuration: 'Magritte3';
    version: '3.1.4';
    repository: 'http://smalltalkhub.com/mc/Magritte/Magritte3/main';
    onUpgradeUseLoaded: #('Seaside3');
    load: 'Seaside'.
  ```

2. Dsallow upgrades for all projects with the **#disallowUpgrades** message:

  ```Smalltalk
  Metacello new
    configuration: 'Magritte3';
    version: '3.1.4';
    repository: 'http://smalltalkhub.com/mc/Magritte/Magritte3/main';
    onUpgradeUseLoaded;
    load: 'Seaside'.
  ```

3. Access the underlying exception and the loaded and incoming Metacello regitrations with the **#onUpgrade:** message:

  ```Smalltalk
  Metacello new
    configuration: 'Magritte3';
    version: '3.1.4';
    repository: 'http://smalltalkhub.com/mc/Magritte/Magritte3/main';
    onUpgrade: [:ex :loaded :incoming |
      incoming baseName = 'Seaside3'
        ifTrue: [ ex useLoaded ]
        ifFalse: [ 
          "default"
          ex useIncoming ];
    load: 'Seaside'.
  ```

####Downgrade
When an earlier version of an already loaded project is indirectly loaded, a **MetacelloAllowProjectDowngrade** exception is signaled.
By default, downgrades are disallowed (`useLoaded`). 

If you want to override the default behavior you can use one of the following expressions:

1. Allow a downgrade of Seaside3 project with the **allowDowngrades:** message:

  ```Smalltalk
  Metacello new
    configuration: 'Magritte3';
    version: '3.1.4';
    repository: 'http://smalltalkhub.com/mc/Magritte/Magritte3/main';
    onDowngradeUseIncoming: #('Seaside3');
    load: 'Seaside'.
  ```

2. Allow downgrades for all projects with the **allowDowngrades** message:

  ```Smalltalk
  Metacello new
    configuration: 'Magritte3';
    version: '3.1.4';
    repository: 'http://smalltalkhub.com/mc/Magritte/Magritte3/main';
    onDowngradeUseIncoming;
    load: 'Seaside'.
  ```

3. Access the underlying exception and the loaded and incoming Metacello regitrations with the **#onDowngrade:** message:

  ```Smalltalk
  Metacello new
    configuration: 'Magritte3';
    version: '3.1.4';
    repository: 'http://smalltalkhub.com/mc/Magritte/Magritte3/main';
    onDowngrade: [:ex :loaded :incoming |
      incoming baseName = 'Seaside3'
        ifTrue: [ ex useIncoming ]
        ifFalse: [ 
          "default"
          ex useLoaded ];
    load: 'Seaside'.
  ```

####Conflicts
When the type of project (configuration or baseline) or repository for an already loaded project is changed while doing an indirect load, a **MetacelloAllowConflictingProjectUpgrade** exception is signaled.
By default, a **MetacelloConflictingProjectError** is signalled if the **MetacelloAllowConflictingProjectUpgrade** exception is unhandled.
As a consequence, you must decide how you want to have the conflict resolved: 

* use the incoming project specification
* use the loaded project specification

1. The **onConflictUseIncoming:useLoaded:** message can be used to specify the names of the projects for which you want to use the incoming or loaded project specifications:

  ```Smalltalk
  Metacello new
    configuration: 'Magritte3';
    version: '3.1.4';
    repository: 'http://smalltalkhub.com/mc/Magritte/Magritte3/main';
    onConflictUseIncoming: #('Seaside3') useLoaded: #('Grease');
    load: 'Seaside'.
  ```

2. Use the incoming project specifications for all projects with the **onConflictsUseIncoming** message:

  ```Smalltalk
  Metacello new
    configuration: 'Magritte3';
    version: '3.1.4';
    repository: 'http://smalltalkhub.com/mc/Magritte/Magritte3/main';
    onConflictUseIncoming;
    load: 'Seaside'.
  ```

3. Use the loaded project specifications for all projects with the **onConflictsUseLoaded** message:

  ```Smalltalk
  Metacello new
    configuration: 'Magritte3';
    version: '3.1.4';
    repository: 'http://smalltalkhub.com/mc/Magritte/Magritte3/main';
    onConflictUseLoaded;
    load: 'Seaside'.
  ```

4. Access the underlying exception and the loaded and incoming Metacello regitrations with the **#onConflict:** message:

  ```Smalltalk
  Metacello new
    configuration: 'Magritte3';
    version: '3.1.4';
    repository: 'http://smalltalkhub.com/mc/Magritte/Magritte3/main';
    onConflict: [:ex :loaded :incoming |
      incoming baseName = 'Seaside3'
        ifTrue: [ ex useIncoming ]
        ifFalse: [ 
          "default - throw error"
          ex pass ];
    load: 'Seaside'.
  ```

##Listing

Once you've loaded one or more projects into your image, you may want to
list them. The following is an example of the [`list` command][6]:

```Smalltalk
Metacello image
  configuration: [:spec | true ];
  list.
```

The `image` message tells Metacello that you'd like to look
at only loaded configurations. 

The *block* argument to the
`configuration:` message is used to *select* against the list of loaded
[MetacelloProjectSpec][7] instances in the [registry][8].

The `list` command itself returns a list of [MetacelloProjectSpec][7] instances that can be printed, inspected or otherwise manipulated.

In addition to a *select block*, you can specify a *select collection*
specifying the names of the projects you'd like to select:

```Smalltalk
Metacello registry
  configuration: #('Seaside3' 'MetacelloPreview');
  list.
```

The `registry` message tells Metacello that you'd like to
look at all projects in the [registry][8] whether or not they are loaded.

The *collection* argument to the `configuration:` message is used to
*select* against the list of project names in the [registry][8].

The `list` command can also be used to look at configurations in
Monticello repositories. For example:

```Smalltalk
Metacello new
  configuration: [:spec | spec name beginsWith: 'Seaside'];
  smalltalkhubUser: 'Seaside' project: 'Seaside31';
  list.
```

lists the configurations whose names (sans the `ConfigurationOf`) begin
with `Seaside` in the
[smalltalk hub](http://smalltalkhub.com/mc/Seaside/Seaside31/main) repostory.

## Getting

Once you've loaded a project into your image the next logical step is
upgrading your project to a new version. 

Let's say that a new `#stable` version of Seaside3 has been released
and that you want to upgrade. This is a two step process: 

* [get a new version of the configuration][11]
* [load the new version][12]

### Get a new version of the configuration

The following expression gets the latest version of the
configuration:

```Smalltalk
Metacello image
  configuration: 'Seaside3';
  get.
```

By using the `image` message, you can leverage the fact that the [registry][8] remembers
from which repository you loaded the original version of the configuration.

The `get` command simply downloads the latest version of the
configuration package from that repository.

You may download the configuration from a different repository:

```Smalltalk
Metacello image
  configuration: 'Seaside3';
  smalltalkhubUser: 'Seaside' project: 'MetacelloConfigurations';
  get.
```

The `get` command will update the [registry][8] with the new
repository location information.

You may also use the `get` command to load a configuration for a project
into your image without actually loading the project itself:

```Smalltalk
Metacello image
  configuration: 'Magritte3';
  repository: 'http://smalltalkhub.com/mc/Magritte/Magritte3/main';
  get.
```

The 'Magritte3' project information will be registered in the [registry][8] and marked
as *unloaded*.

### Load the new version

Once you've got a new copy of the Seaside30 configuration loaded into your image, you may
upgrade your image with the following expression:

```Smalltalk
Metacello image
  configuration: 'Seaside3';
  version: #stable;
  load.
```

By using the `image` message, you are asking Metacello to look the
project up in the [registry][8] before performing the
operation, so it isn't necessary to supply all of the project details for every
command operation.

Of course, the `load` command updates the [registry][8].

If you want to load a project for which you've already done a `get`
(like the Magritte project earlier), you can do the following:

```Smalltalk
Metacello registry
  configuration: 'Magritte';
  version: #stable;
  load.
```

In this case you use the `registry` message to indicate that you are
interested in both *loaded* and *unloaded* projects.

##Locking

Let's say that you are using an older version of Seaside3 (say 3.1.1)
instead of the #stable version (3.1.3) and that your application doesn't
work with newer versions of Seaside3 (you've tried and it's more work
to get you application to work with the newer version of Seaside3 than
it's worth).

Let's also say that you want to try out something in the
Magritte project, but when you try loading Magritte, you end up
having Seaside 3.1.3 loaded as well. 

This is an unfortunate side effect of Metacello trying to *do the right
thing*, only in your case it is the wrong thing.

Fortunately, the [`lock` command][9] can give you control. First you
need to `lock` the Seaside3 project:

```Smalltalk
Metacello image
  configuration: 'Seaside3';
  lock.
```

The `image` message tells Metacello to do a lookup in the list of loaded
projects and then to put a lock on the loaded version of the project.

If you want you can specify which version of the project you want
locked:

```Smalltalk
Metacello image
  configuration: 'Seaside3';
  version: '3.1.2';
  lock.
```

After a project is locked Metacello will always use the locked project
specification (version and repository) for resolving packages and 
dependent projects.

If a different version or repository is specified during a load, a
Warning is raised notifying you that the locked project specification
will be used.

If you don't want an interactive Warning to be raised during your load,
you can use `onWarningLog` to log and resume the Warning:

```Smalltalk
Metacello registry
  configuration: 'Magritte3';
  onWarningLog;
  load.
```

If you want to track the use of locks explicitly you can use `onLock:`
which is only triggered when a locked project is involved:

```Smalltalk
Metacello registry
  configuration: 'Magritte3';
  onLock: [:ex :existing :new | 
    Transcript cr; show: 'Locked project: ', existing projectName printString.
    ex honor];
  load.
```

### Breaking locks

Let's say that when you load the Magritte3 project you have decided
that in this particular case you would like to bypass the lock and let
the version of Seaside specified by the Magritte3 project to be loaded.

We'll use `onLock:` to `break` the lock and allow the new version of the Seaside project to
be loaded:

```Smalltalk
Metacello registry
  configuration: 'Magritte3';
  onLock: [:ex :existing :new | 
    existing baseName = 'Seaside3'
      ifTrue: [ ex break ].
    ex pass ];
  load.
```

use the message `honor` if you want to honor the lock and not load the new version.

`break` is a synonym for `allow` and `honor` is a synonym for `disallow`.

With `onLockBreak:` you only need to supply the name of the projects for which you want the locks broken:

```Smalltalk
Metacello registry
  configuration: 'Magritte3';
  onLockBreak: #( 'Seaside3' );
  load.
```

If you want to `break` all locks uncoditionally then use `onLockBreak`:

```Smalltalk
Metacello registry
  configuration: 'Magritte3';
  onLockBreak;
  load.
```

When a lock is broken, the project is not unlocked. 
The lock remains and is applied to the to the freshly loaded version and repository.

### Upgrading a locked project

If you want to explicitly upgrade a locked project, you can use the
`load` command. The following command will upgrade Seaside3 to version
3.1.2 even if it is locked:

 ```Smalltalk
Metacello image
  configuration: 'Seaside3';
  version: '3.1.2';
  lock.
```

The newly loaded version of the project will continue to be locked.

[1]: MetacelloScriptingAPI.md
[2]: http://www.lukas-renggli.ch/blog/gofer
[3]: MetacelloScriptingAPI.md#repository-descriptions
[4]: MetacelloScriptingAPI.md#repository-shortcuts
[5]: MetacelloScriptingAPI.md#loading
[6]: MetacelloScriptingAPI.md#listing
[7]: MetacelloScriptingAPI.md#metacelloprojectspec
[8]: MetacelloScriptingAPI.md#metacello-project-registry
[9]: MetacelloScriptingAPI.md#locking
[10]: MetacelloScriptingAPI.md#metacello-version-numbers
[11]: #get-a-new-version-of-the-configuration
[12]: #load-the-new-version

