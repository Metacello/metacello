# Lock Command Reference

When you put a project into production you should be managing the
references to *external projects* very carefully. You cannot afford to
have an innocent update by the external project maintainers introduce a
regression into your production application.

In the past, if you wanted to take *total control* of your project's source code,
you needed to resort to using [repository overrides][3] or
editting configuration files directly. Neither of these options are
ideal.

## `lock` command 

The `lock` command was created to provide developers with
explicit control over which **version** of a project is to be used.

When you `lock` a configuration-based project:

```Smalltalk
Metacello new
  configuration: 'External';
  version: '1.0.0';
  repository: 'filetree:///opt/git/external';
  lock.
```
you are telling Metacello to **always** use the given *version* and
to **always** load the configuration from the given *repository*.

If you specify a locally owned, disk-based repository as in the example above,
you have effectively taken control of the configuration and are able to
insulate yourself from any changes made to the configuration.

When you `lock` a baseline-based project:

```Smalltalk
Metacello new
  baseline: 'External';
  repository: 'filetree:///opt/git/external';
  lock.
```
you are telling Metacello to **always** load the baseline from the given
**repository** and, given the way that baseine-based projects work, to
**always** load the packages referenced by the baseline specification
from the given **repository**.

By using a baseline-based project you are able to take control of the
specificaion **and** the packages.

## How the `lock` command works

When a project is `locked`, Metacello records the project specification details
(*project name*, *version*, and *repository*) in the project registry
and marks the registration as **locked**.

[](#metacello-project-`load`-details)

If, after locking a project, you load a project with a project
reference like the following (version '1.0.0' and repository 'http://ss3.gemtalksystems.com/ss/external'):

```Smalltalk
spec
  configuration: 'External'
    with: [ 
      spec
        version: '1.1.0';
          loads: 'External Core';
          repository: 'http://ss3.gemtalksystems.com/ss/external' ];
 ```
Metacello 

Before getting started, you need to make sure that you've [installed the
Metacello Preview][5] into your system.

## Example Projects

In order to give you a better feel for how the `lock` command works,
I've created a collection of projects that can be used for hands on
experiments with various aspects of the `lock` command:

- [Example Project](#example-project)
- [Alternate Project](#alternate-project)
- [External Project](#external-project)
- [Sample Project](#sample-project)

### Example Project Structure

The [**Example** project][4] has been created to represent *your* production
application. For the purposes of this tutorial, you *own* the baseline and the packages associated with
this project. So let's clone the github repository to your local disk
and checkout the `otto` branch:

```Shell
cd /opt/git
git clone git@github.com:dalehenrich/example.git
cd example
git checkout otto
```
Now, let's load the `BaselineOfExample` into our image, so we can see
the structure of the project:

```Smalltalk
Metacello new.
  baseline: 'Example';
  repository: 'filetree:///opt/git/example/repository';
  get.
```
With the baseline loaded, let's navigate to the baseline spec
(`BaselineOfExample>>baseline:`) and see what we have:

```Smalltalk
baseline: spec
  <baseline>
  spec
    for: #'common'
    do: [ 
      spec
        baseline: 'Alternate'
          with: [ spec repository: 'github://dalehenrich/alternate:otto/repository' ];
        import: 'Alternate' provides: #('Alternate Core' 'Alternate Tests');
        yourself.
      spec
        package: 'Example-Core' with: [ spec requires: #('Alternate Core') ];
        package: 'Example-Tests'
          with: [ spec requires: #('Example-Core' 'Alternate Tests') ];
        yourself.
      spec
        group: 'default' with: #('Core');
        group: 'Core' with: #('Example-Core');
        group: 'Tests' with: #('Example-Tests');
        group: 'Example Core' with: #('Core');
        group: 'Example Tests' with: #('Tests');
        yourself ]
```
From the baseline we see that there is a single *external project*
referenced: 

- [Alternate Project](#alternate-project)

For the purposes of this tutorial, the
**Alternate** project is the moral equivalent of [Seaside][6] (a project
that itself is composed of a number projects).

Let's load `BaselineOfAlternate`:

```Smalltalk
Metacello new.
  baseline: 'Alternate';
  repository: 'github:/dalehenrich/alternate:otto/repository';
  get.
```
navigate to the baseline spec
(`BaselineOfAlternate>>baseline:`) and see what we have:

```Smalltalk
baseline: spec
  <baseline>
  spec
    for: #'common'
    do: [ 
      spec
        configuration: 'External'
          with: [ 
              spec
                version: '1.0.0';
                loads: 'External Core';
                repository: 'http://ss3.gemtalksystems.com/ss/external' ];
        baseline: 'Sample'
          with: [ spec repository: 'github://dalehenrich/sample:otto/repository' ];
        import: 'Sample' provides: #('Sample Core' 'Sample Tests');
        yourself.
      spec
        package: 'Alternate-Core'
          with: [ spec requires: #('Sample Core' 'External') ];
        package: 'Alternate-Tests'
          with: [ spec requires: #('Alternate-Core' 'Sample Tests') ];
        yourself.
      spec
        group: 'default' with: #('Core');
        group: 'Core' with: #('Alternate-Core');
        group: 'Tests' with: #('Alternate-Tests');
        group: 'Alternate Core' with: #('Core');
        group: 'Alternate Tests' with: #('Tests');
        yourself ]
```
The **Alternate** project is composed of two more *external projects*:

- [External Project](#external-project)
- [Sample Project](#sample-project)

### Take control of the source

The first step is to make local copies of each of the external project repositories. With
local copies, you can ensure that the repository contents won't be
changed without your knowledge, and you can protect youself from third party server and network outages. 

#### BaselineOf projects

Clone the **Sample** and **Alternate** `git` repositories:

```Shell
cd /opt/git
git clone git@github.com:dalehenrich/sample.git
git clone git@github.com:dalehenrich/alternate.git
```

#### ConfigurationOf projects

The **External** project is a configuration-based project, so you'll need
to:

1. Create a local filetree repository.
2. Copy the packages from the http repository into the local filetree
   repository.
3. Create a **BaselineOfExternal** to replace the **ConfigurationOfExternal**.

##### Local filetree repository

First create a local directory for the repository (ans
optionally turn the directory into a git repository):
 
```Shell
cd /opt/git
mkdir externalDir
cd externalDir
mkdir repository
git init
```

##### Copy packages to filetree repository

Use the `fetch` command to download the project packages into the
filetree repository:

```Smalltalk
Metacello new
  configuration: 'External';
  version: '1.0.0';
  repository: 'http://ss3.gemtalksystems.com/ss/external';
  cacheRepository: 'filetree:///opt/git/externalDir/repository';
  ignoreImage;
  fetch: 'ALL'.
```
If you project is more complex (i.e., has dependent projects) then you
will want to isolate each project in it's own git repository. In that
case you will want to use the [complex project download script][#package-download-script-for-complex-projects].

##### Create a BaselineOf

Start by creating the **BaselineOfExternal** as a subclass of
**BaselineOf**. The class should be in a category of the same name and
create a package for that category as well. Then copy the appropriate baseline
method from **CofigurationOfExternal** in this 
case `ConfigurationOfExternal>>baseline1000:`:

```Smalltalk
baseline1000: spec
  <baseline: '1.0.0-baseline'>
  spec
    for: #'common'
    do: [ 
      spec blessing: #'baseline'.
      spec repository: 'http://ss3.gemstone.com/ss/external'.
      spec
        package: 'External-Core';
        package: 'External-Tests' with: [ spec requires: 'External-Core' ];
        yourself.
      spec
        group: 'default' with: #('Core');
        group: 'Core' with: #('External-Core');
        group: 'Tests' with: #('External-Tests');
        group: 'External Core' with: #('Core');
        group: 'External Tests' with: #('Tests');
        yourself ]
```
into `BaselineOfExternal>>baseline:` and edit out the unnecessary
statements. In this case we only needed to change the pragma to `<baseline>` and 
remove the #blessing: and #repository: statements:

```Smalltalk
baseline: spec
  <baseline>
  spec
    for: #'common'
    do: [ 
     spec
        package: 'External-Core';
        package: 'External-Tests' with: [ spec requires: 'External-Core' ];
        yourself.
      spec
        group: 'default' with: #('Core');
        group: 'Core' with: #('External-Core');
        group: 'Tests' with: #('External-Tests');
        group: 'External Core' with: #('Core');
        group: 'External Tests' with: #('Tests');
        yourself ]
```
### Lock the projects

Now that the repositories have been cloned to your local disk, the
`lock` command can be used to associate the local repository with each
of the projects:

```Smalltalk
Metacello new
  baseline: 'Alternate';
  repository: 'filetree:///opt/git/alternate/repository';
  lock.
Metacello new
  baseline: 'External';
  repository: 'filetree:///opt/git/externalDir/repository';
  lock.
Metacello new
  baseline: 'Sample';
  repository: 'filetree:///opt/git/sample/repository';
  lock.
```
### Load the Example

Use the following set of expressions to load the **Example** project:

```Smalltalk
Metacello new
  baseline: 'Example';
  repository: 'github://dalehenrich/example:otto/repository';
  get.
Metacello registry
  baseline: 'Example';
  onConflict: [ :ex :existing | 
    existing locked
      ifTrue: [ ex useIncoming ].
    ex pass ];
  onLock: [ :ex | ex honor ];
  load: 'Tests'.
```
The `onConflict:` block gets triggered because the locked project
specification does not match the incoming specification. 

The `onLock:` block gets triggered every time a locked project is loaded, 
because you should always be informed when a locked project is
referenced, since you always run the risk of introducing an
incompatibility when you aren't using the official repository.

## Appendix

### Alternate Project

Baseline: 

```Smalltalk
baseline: spec
  <baseline>
  spec
    for: #'common'
    do: [ 
      spec
        configuration: 'External'
          with: [ 
              spec
                version: '1.0.0';
                loads: 'External Core';
                repository: 'http://ss3.gemtalksystems.com/ss/external' ];
        baseline: 'Sample'
          with: [ spec repository: 'github://dalehenrich/sample:otto/repository' ];
        import: 'Sample' provides: #('Sample Core' 'Sample Tests');
        yourself.
      spec
        package: 'Alternate-Core'
          with: [ spec requires: #('Sample Core' 'External') ];
        package: 'Alternate-Tests'
          with: [ spec requires: #('Alternate-Core' 'Sample Tests') ];
        yourself.
      spec
        group: 'default' with: #('Core');
        group: 'Core' with: #('Alternate-Core');
        group: 'Tests' with: #('Alternate-Tests');
        group: 'Alternate Core' with: #('Core');
        group: 'Alternate Tests' with: #('Tests');
        yourself ]
```

### External Project

Configuration:

```Smalltalk
baseline1000: spec
  <version: '1.0.0-baseline'>
  spec
    for: #'common'
    do: [ 
      spec blessing: #'baseline'.
      spec repository: 'http://ss3.gemstone.com/ss/external'.
      spec
        package: 'External-Core';
        package: 'External-Tests' with: [ spec requires: 'External-Core' ];
        yourself.
      spec
        group: 'default' with: #('Core');
        group: 'Core' with: #('External-Core');
        group: 'Tests' with: #('External-Tests');
        group: 'External Core' with: #('Core');
        group: 'External Tests' with: #('Tests');
        yourself ]
```
Baseline:

```Smalltalk
baseline: spec
  <baseline>
  spec
    for: #'common'
    do: [ 
      spec
        package: 'External-Core';
        package: 'External-Tests' with: [ spec requires: 'External-Core' ];
        yourself.
      spec
        group: 'default' with: #('Core');
        group: 'Core' with: #('External-Core');
        group: 'Tests' with: #('External-Tests');
        group: 'External Core' with: #('Core');
        group: 'External Tests' with: #('Tests');
        yourself ]
```

### Sample Project

Baseline: 

```Smalltalk
baseline: spec
  <baseline>
  spec
    for: #'common'
    do: [ 
      spec package: 'Sample-Core'.
      spec package: 'Sample-Tests' with: [ spec requires: 'Sample-Core' ].
      spec
        group: 'default' with: #('Sample-Core');
        group: 'Core' with: #('Sample-Core');
        group: 'Tests' with: #('Sample-Tests');
        group: 'Sample Core' with: #('Core');
        group: 'Sample Tests' with: #('Tests');
        yourself ]
```

### Package download script for complex projects

```Smalltalk
| configClass cacheRepository version |
configClass := ConfigurationOfExternal.
cacheRepository := MCDirectoryRepository
  directory: (FileDirectory on:'/opt/git/externalDir/repository').
cacheRepository := MCRepositoryGroup default repositories
  detect: [ :each | each = cacheRepository ]
  ifNone: [ cacheRepository ].
version := configClass project version: '1.0.0'.
version ignoreImage: true.
(version record: 'ALL') loadDirective
  versionDirectivesDo: [ :versionDirective | 
    | p pClass |
    versionDirective spec ~~ nil
      ifTrue: [ 
        p := versionDirective spec project.
        pClass := p configuration class.	"save packages for configClass only"
        (pClass == configClass)
          ifTrue: [ 
            | policy |
            policy := (Smalltalk at: #'MetacelloLoaderPolicy') new
              cacheRepository: cacheRepository;
              ignoreImage: true;
              yourself.
            p fetchProject: policy.
            versionDirective
              packagesDo: [ :packageDirective | 
                "skip nested configurations"
                (packageDirective spec name beginsWith: 'ConfigurationOf')
                  ifFalse: [ 
                    "fetch mcz file"
                    packageDirective spec fetchPackage: policy ] ] ] ] ]
```

### Example project unload script

```Smalltalk
| gofer |
gofer := Gofer new.
#('BaselineOfExample' 'ConfigurationOfExternal' 'BaselineOfExternal' 
  'External-Core' 'External-Tests' 'BaselineOfSample' 'Example-Core' 
  'Example-Tests' 'Sample-Core' 'Sample-Tests') do: [:packageName |
    (MCWorkingCopy allManagers 
      detect: [:wc | wc packageName = packageName ]
      ifAbsent: [])
        ifNotNil: [ gofer package: packageName ] ].
gofer unload. 
```
## Metacello project `load` details

During a `load`, when a project reference is encountered, Metacello
routinely looks up the project in the project registry to see which
version of the project is present in the image. 

If the project is
present in the image, the details for the *existing project* are compared to the
details for the *incoming project*. If there are differences (older
version or different repository location), a *project resolution exception*
is signalled and the developer must choose whether to continue the load
with the *existing project* or the *incoming project*. *Project
resolution exceptions* come in three flavors:

- Upgrade. The *incoming project spec* is newer than *existing
  version project spec*
- Downgrade. The  *incoming project spec* is older than *existing
  project spec*
- Conflict. The *incoming repository* is different than the *existing
  repository* or the project is switching from *configuration-based* 
  to *baseline-based*, etc.

The default action for the *upgrade exception* is to use the *incoming
project*. The *downgrade exception* and *conflict exception* must be
handled. The `onUpgrade:`, `onDowngrade:` and `onConflict:` directives
are provided to simplify the mechanics of exception handling during a
`load`.

Once the
developer has chosen which *project spec* to load, the registration is checked a final time.
If the project spec is locked a *locked project change exception* is signalled 
and the developer must choose to *honor the lock* or to *break the lock*



[1]: MetacelloScriptingAPI.md#locking
[2]: MetacelloUserGuide.md#locking
[3]: https://code.google.com/p/metacello/wiki/FAQ#How_do_I_override_the_repository_for_a_config?
[4]: https://github.com/dalehenrich/example/tree/otto
[5]: https://github.com/dalehenrich/metacello-work/blob/master/README.md
[6]: http://seaside.st
[7]: https://github.com/dalehenrich/filetree
