# Locking Example

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

