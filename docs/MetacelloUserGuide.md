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
  package: 'ConfigurationOfSeaside30';
  ss3: 'MetaRepoForPharo20';
  load.
((Smalltalk at: #ConfigurationOfSeaside30) version: #stable) load.
```

In the early days of Metacello (and Gofer) this was a great improvement
over the alternatives, but today, 3 years after the introduction of
Metacello, there should be a better way...and there is.
Using the *Metacello Scripting API* the above expression reduces to the
following:

```Smalltalk
Metacello new
  configuration: 'Seaside30';
  load.
```

## Loading

In this example of the [`load` command][5] we are leveraging a couple of
default values, namely the `version` of the project and the `repository` where the
**ConfigurationOfSeaside** package can be found:

```Smalltalk
Metacello new
  configuration: 'Seaside30';
  load.
```

Here is a variant
of the same expression with the (current) default values explicitly specified:

```Smalltalk
Metacello new
  configuration: 'Seaside30';
  version: #stable;
  ss3: 'MetaRepoForPharo20';
  load.
```

The `version` attribute can be any legal [version number][10].
`ss3:` is a [repository shortcut][4]. You can also specify the
full [repository description][3] as follows:

```Smalltalk
Metacello new
  configuration: 'Seaside30';
  version: #stable;
  repository: 'http://ss3.gemtalksystems.com/ss/MetaRepoForPharo20';
  load.
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
  configuration: #('Seaside30' 'MetacelloPreview');
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
  ss3: 'MetaRepoForPharo20';
  list.
```

lists the configurations whose names (sans the `ConfigurationOf`) begin
with `Seaside` in the `MetaRepoForPharo20` in the
[ss3](http://ss3.gemtalksystems.com/) repostory.

## Getting

Once you've loaded a project into your image the next logical step is
upgrading your project to a new version. 

Let's say that a new `#stable` version of Seaside30 has been released
and that you want to upgrade. This is a two step process: 

* [get a new version of the configuration][11]
* [load the new version][12]

### Get a new version of the configuration

The following expression gets the latest version of the
configuration:

```Smalltalk
Metacello image
  configuration: 'Seaside30';
  get.
```

By using the `image` message, you can leverage the fact that the [registry][8] remembers
from which repository you loaded the original version of the configuration.

The `get` command simply downloads the latest version of the
configuration package from the repository.

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
  configuration: 'SeasideRest';
  repository: 'http://smalltalkhub.com/mc/Seaside/MetacelloConfigurations/main';
  get.
```

The 'SeasideRest' project information will be registered in the [registry][8] and marked
as *unloaded*.

### Load the new version

Once you've got a new copy of the Seaside30 configuration loaded into your image, you may
upgrade your image with the following expression:

```Smalltalk
Metacello image
  configuration: 'Seaside30';
  version: #stable;
  load.
```

By using the `image` message, you are asking Metacello to look the
project up in the [registry][8] before performing the
operation, so it isn't necessary to supply all of the project details for every
command operation.

Of course, the `load` command updates the [registry][8].

If you want to load a project for which you've already done a `get`
(like the SeasideRest project earlier), you can do the following:

```Smalltalk
Metacello registry
  configuration: 'SeasideRest';
  version: #stable;
  load.
```

In this case you use the `registry` message to indicate that you are
interested in both *loaded* and *unloaded* projects.

##Locking

Let's say that you are using an older version of Seaside30 (say 3.0.5)
instead of the #stable version (3.0.7) and that your application doesn't
work with newer versions of Seaside30 (you've tried and it's more work
to get you application to work with the newer version of Seaside30 than
it's worth).

Let's also say that you want to try out something in the
SeasideRest project, but when you try loading SeasideRest, you end up
having Seaside 3.0.7 loaded as well. 

This is an unfortunate side effect of Metacello trying to *do the right
thing*, only in your case it is the wrong thing.

Fortunately, the [`lock` command][9] can give you control. First you
need to `lock` the Seaside30 project:

```Smalltalk
Metacello image
  configuration: 'Seaside30';
  lock.
```

The `image` message tells Metacello to do a lookup in the list of loaded
projects and then to put a lock on the loaded version of the project.

If you want you can specify which version of the project you want
locked:

```Smalltalk
Metacello image
  configuration: 'Seaside30';
  version: '3.0.5';
  lock.
```

After a project is locked Metacello will always use the locked project
specification (version and repository) for resolving packages and 
dependent projects.

If a different version or repository is specified during a load, a
Warning is raised notifying you that the locked project specification
will be used.

If you don't want an interactive Warning to be raised during your load,
you can use `onWarning:` to log and resume the Warning:

```Smalltalk
Metacello new
  configuration: 'SeasideRest';
  version: #stable;
  onWarning: [:ex | 
    Transcript cr; show: 'Warning: ', ex description.
    ex resume ];
  load.
```

If you want to track the use of locks explicitly you can use `onLock:`
which is only triggered when a locked project is involved:

```Smalltalk
Metacello new
  configuration: 'SeasideRest';
  version: #stable;
  onLock: [:ex :existing :new | 
    Transcript cr; show: 'Locked project: ', existing projectName printString.
    ex pass ];
  load.
```

### Bypassing locks

Let's say that when you load the SeasideRest project you have decided
that in this particular case you would like to bypass the lock and let
the version of Seaside specified by the SeasideRest project to be loaded.

We'll use `onLock:` to `break` the new version of the Seaside project to
be loaded:

```Smalltalk
Metacello new
  configuration: 'SeasideRest';
  version: #stable;
  onLock: [:ex :existing :new | 
    existing baseName = 'Seaside30'
      ifTrue: [ ex break ].
    ex pass ];
  load.
```

use the message `honor` if you want to honor the lock and not load the new version.

`break` is a synonym for `allow` and `honor` is a synonym for `disallow`.

### Upgrading a locked project

If you want to explicitly upgrade a locked project, you can use the
`load` command. The following command will upgrade Seaside30 to version
3.0.6 even if it is locked:

 ```Smalltalk
Metacello image
  configuration: 'Seaside30';
  version: '3.0.6';
  lock.
```

The newly loaded of the project will continue to be locked.

### Locking Example

A [detailed locking example project](LockCommandReference.md) is available.

## Switching Project Repositories

If you have loaded a project directly from GitHub, say
the Zinc repository:

```Smalltalk
Metacello new
  baseline: 'Zinc';
  repository: 'github://glassdb/zinc:gemstone3.1/repository';
  get.
Metacello new
  baseline: 'Zinc';
  repository: 'github://glassdb/zinc:gemstone3.1/repository';
  load: 'Tests'
```

The ``github://` repository is read only. If you want to save new versions 
of packages to the repository, you must clone the GitHub repository to your
local disk:

```Shell
cd /opt/git
git clone https://github.com/glassdb/zinc.git
cd zinc
git checkout gemstone3.1
```

Then load Zinc from the local git repository using a
`filetree://` repository:

```Smalltalk
Metacello new
  baseline: 'Zinc';
  repository: 'filetree:///opt/git/zinc/repository';
  get.
Metacello new
  baseline: 'Zinc';
  repository: 'filetree:///opt/git/zinc/repository';
  onConflict: [:ex | ex useNew ];
  load: 'Tests'
```

Note that we are using an `onConflict:` block.

Metacello recognizes that you are loading the project
from a different repository than the one originally used and that is 
considered an error. Metacello signals a **MetacelloConflictingProjectError**.

To avoid the **MetacelloConflictingProjectError** you use the
`onConflict:` block and send `useNew` to the exception to use the new project
or `useExisting` to preserve the loaded state`.

## Project upgrades initiated by dependent proejcts

If we return to the earlier example where we have loaded Seaside 3.0.5
into our image:

```Smalltalk
Metacello image
  configuration: 'Seaside30';
  version: '3.0.5';
  load.
```

and then attempt to load SeasideRest which requires Seaside 3.0.7:

```Smalltalk
Metacello image
  configuration: 'SeasideRest';
  version: #'stable';
  load.
```

In the absence of locks, Metacello will silently upgrade the Seaside
project to Seaside 3.0.7. If you'd like to explicitly track Seaside
upgrades, you can use `onUpgrade:`:

```Smalltalk
Metacello image
  configuration: 'SeasideRest';
  version: #'stable';
  onUpgrade: [:ex :existing :new |
    existing baseName = 'Seaside30'
      ifTrue: [ 
        Transcript cr; show: 'Seaside30 upgraded to: ', new versionString ].
    ex pass ].
  load.
```

If you would like to explicitly prevent the upgrade (without using a
lock) you can do the following:

```Smalltalk
Metacello image
  configuration: 'SeasideRest';
  version: #'stable';
  onUpgrade: [:ex :existing :new |
    existing baseName = 'Seaside30'
      ifTrue: [ ex disallow ].
    ex pass ].
  load.
```

If we assume that you have already loaded Seaside 3.0.9
into our image:

```Smalltalk
Metacello image
  configuration: 'Seaside30';
  version: '3.0.9';
  load.
```

and then attempt to load SeasideRest which requires version Seaside 3.0.7:

```Smalltalk
Metacello image
  configuration: 'SeasideRest';
  version: #'stable';
  load.
```
Metacello will silently ignore the downgrade request for Seaside and
leave Seaside 3.0.9 installed in the image.

If you want to have Seaside 3.0.9 downgraded then you used the `onDowngrade:` block:

```Smalltalk
Metacello image
  configuration: 'SeasideRest';
  version: #'stable';
  onDowngrade: [:ex :existing :new |
    existing baseName = 'Seaside30'
      ifTrue: [ ex allow ].
    ex pass ].
  load.
```

and Seaside 3.0.7 will be loaded.

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

