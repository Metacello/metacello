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

Before getting started, you need to make sure that you've [installed the
Metacello Preview][5] into your system.

## Example Projects

In order to give you a better feel for how the `lock` command works,
I've created a collection of projects that can be used for hands on
experiments with various aspects of the `lock` command:

- [Example Project](#example-project)
- [External Project](#external-project)
- [Sample Project](#sample-project)

### Example Project

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
        configuration: 'External'
          with: [ 
              spec
                version: #'otto';
                loads: 'External Core';
                repository: 'http://ss3.gemtalksystems.com/ss/external' ];
        baseline: 'Sample'
          with: [ spec repository: 'github://dalehenrich/sample:otto/repository' ];
        import: 'Sample' provides: #('Sample Core' 'Sample Tests');
        yourself.
      spec
        package: 'Example-Core'
          with: [ spec requires: #('Sample Core' 'External') ];
        package: 'Example-Tests'
          with: [ spec requires: #('Example-Core' 'Sample Tests') ];
        yourself.
      spec
        group: 'default' with: #('Core');
        group: 'Core' with: #('Example-Core');
        group: 'Tests' with: #('Example-Tests');
        group: 'Example Core' with: #('Core');
        group: 'Example Tests' with: #('Tests');
        yourself ]
```
From the baseline we see that there are two *external projects*
referenced:

- [External Project](#external-project)
- [Sample Project](#sample-project)

It's these two projects that we are going to need to take control of in
order to protect ourselves from unwanted changes. 

#### Local repository copies

The first step is to make local copies of each of the repositories. With
local copies, we ensure that the repository contents won't be
changed without our knowledge, and we protect ourselves from network
outages. 

Being a `git` repository, the **Sample** project is easy to clone:

```Shell
cd /opt/git
git clone git@github.com:dalehenrich/sample.git
```
To clone the **External** project we'll use `Gofer` to copy the
versions of packages that we're interested in:

```Shell
cd /opt/git
mkdir externalDir
```
Then:

```Smalltalk
| repo |
Gofer new
  version: 'External-Core-dkh.6';
  version: 'External-Tests-dkh.3';
  version: 'ConfigurationOfExternal-dkh.15';
  url: 'http://ss3.gemstone.com/ss/external';
  fetch.
repo := MCDirectoryRepository
         directory: (FileDirectory on: '/opt/git/externalDir'.
Gofer new
  version: 'External-Core-dkh.6';
  version: 'External-Tests-dkh.3';
  version: 'ConfigurationOfExternal-dkh.15';
  repository: repo;
  push.
```
This a variation on the [SqueakSource migration script](http://www.squeaksource.com/).

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

### External Project

### Sample Project

[1]: MetacelloScriptingAPI.md#locking
[2]: MetacelloUserGuide.md#locking
[3]: https://code.google.com/p/metacello/wiki/FAQ#How_do_I_override_the_repository_for_a_config?
[4]: https://github.com/dalehenrich/example/tree/otto
[5]: https://github.com/dalehenrich/metacello-work/blob/master/README.md
