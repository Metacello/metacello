# Locking Example

Project locking[1] is a new feature in Metacello. Project locking can be
used to lock the **version** of a project (as described here[1] and
here[2]), but it can also be used to lock the **location**

```Smalltalk
Metacello new.
  baseline: 'Example';
  repository: 'github://dalehenrich/example:otto/repository';
  get.
```

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
                repository: 'http://ss3.gemstone.com/ss/external' ];
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

```Shell
cd /opt/git
git clone git@github.com:dalehenrich/sample.git
```

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

[1]: MetacelloScriptingAPI.md#locking
[2]: MetacelloUserGuide.md#locking
