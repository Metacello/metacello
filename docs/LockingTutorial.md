# Locking Tutorial

[Project locking][1] is a new feature in Metacello. Project locking can be
used to lock the **version** of a project (as described [here][1] and
[here][2]), but it can also be used to lock the **replository location** of a
project, as well.

When you put a project into production you should be managing the
references to *external projects* very carefully. You cannot afford to
have an innocent update by the external project maintainers introduce a
regression into your production application.

In the past, if you wanted to take *total control* of you project's source code,
you needed to resort to using [repository overrides][3] or
editting configuration files directly. Neither of these options are
ideal.

The `lock` command has been introduced to provide developers with
explicit control over which **version/repository** combination is used
for each project. 

When you `lock` a project:

```Smalltalk
Metacello new
  configuration: 'External';
  version: '1.0.0';
  repository: 'server:///opt/git/externalDir';
  lock.
```
you are telling Metacello to **always** use the *version* and
*repository* no matter how it is specified in a configuration or
baseline when it is referenced. 

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
  baseline: 'Examplelternate';
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
changed without your knowledge, and you can we protect yourselves from third party server and network outages. 

Clone the **Sample** and **Alternate** `git` repositories:

```Shell
cd /opt/git
git clone git@github.com:dalehenrich/sample.git
git clone git@github.com:dalehenrich/alternate.git
```
Copy the packages in the **External** repository to local directory:
 
```Shell
cd /opt/git
mkdir externalDir
```
Use `Gofer` to copy the packages into the directory:

```Smalltalk
| source goSource destination goDestination files destinationFiles |

source := MCHttpRepository location: 'http://ss3.gemstone.com/ss/external'.
destination := MCDirectoryRepository
         directory: (FileDirectory on: '/opt/git/externalDir'.

goSource := Gofer new repository: source.
goDestination := Gofer new repository: destination.

files := source allVersionNames.

(goSource allResolved select: [ :resolved | files anySatisfy: [ :each |
    resolved name = each ] ]) do: [ :each | goSource package: each packageName ].

goSource fetch. "downloads all mcz on your computer"

destinationFiles := destination allVersionNames. "checks what files are already at destination"
files reject: [ :file | destinationFiles includes: file ] thenDo: [ :file |
    goDestination version: file ]. "selects only the mcz that are not yet at destination"

goDestination push. "sends everything to the directory repo"
```
### Lock the projects

```Smalltalk
Metacello new
  baseline: 'Alternate';
  repository: 'filetree:///opt/git/alternate/repository';
  lock.
Metacello new
  configuration: 'External';
  version: '1.0.0';
  repository: 'server:///opt/git/externalDir';
  lock.
Metacello new
  baseline: 'Sample';
  repository: 'filetree:///opt/git/sample/repository';
  lock.
```

```Smalltalk
Metacello new
  baseline: 'Example';
  repository: 'github://dalehenrich/example:otto/repository';
  get.
Metacello new
  baseline: 'Example';
  load.
```

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

```Smalltalk
Metacello new
  configuration: 'External';
  version: #otto;
  repository: 'server:///opt/git/externalDir';
  lock.
Metacello new
  baseline: 'Sample';
 repository: 'filetree:///opt/git/sample/repository';
  lock.
```

```Smalltalk
Metacello new.
  baseline: 'Example';
  repository: 'github://dalehenrich/example:otto/repository';
  get.
Metacello new.
  baseline: 'Example';
  load.
```
## Appendix

### Alternate Project

### External Project

### Sample Project

[1]: MetacelloScriptingAPI.md#locking
[2]: MetacelloUserGuide.md#locking
[3]: https://code.google.com/p/metacello/wiki/FAQ#How_do_I_override_the_repository_for_a_config?
[4]: https://github.com/dalehenrich/example/tree/otto
[5]: https://github.com/dalehenrich/metacello-work/blob/master/README.md
[6]: http://seaside.st
