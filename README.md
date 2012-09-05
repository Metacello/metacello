## HOW TO INSTALL

### Clone the `metacello-work` repository:
```shell
  sudo mkdir /opt/git/
  sudo chmod og+rw /opt/git/
  cd /opt/git/
  git clone -b 1.0-beta.31.1.5 https://github.com/dalehenrich/metacello-work
```

### Load Metacello 1.0-beta.31.1.5
```Smalltalk
    | gitRepositoryPath metacelloConfigurationRepository version repositories |
    gitRepositoryPath := '/opt/git/1.0-beta.31/metacello-work/repository'.
    Gofer new
        url: 'http://ss3.gemstone.com/ss/FileTree';
        package: 'ConfigurationOfFileTree';
        load.
    ((Smalltalk at: #'ConfigurationOfFileTree') project version: '1.0')
        load: 'default'.
    Gofer new
        url: 'http://seaside.gemstone.com/ss/metacello';
        package: 'ConfigurationOfGofer';
        load.
    ((Smalltalk at: #'ConfigurationOfGofer') project version: #'stable')
        load.
    metacelloConfigurationRepository := (Smalltalk at: #'MCFileTreeRepository') new
        directory: (FileDirectory on: gitRepositoryPath);
        yourself.
    Gofer new
        disablePackageCache;
        repository: metacelloConfigurationRepository;
        package: 'ConfigurationOfMetacello';
        load.
    version := (Smalltalk at: #'ConfigurationOfMetacello') project version: #stable.
    repositories := (#('http://www.squeaksource.com/MetacelloRepository')
        collect: [ :url | MCHttpRepository location: url user: '' password: '' ]) asSet.
    repositories add: metacelloConfigurationRepository.
    version repositoryOverrides: repositories.
    version load: 'batch'.
```

###TravisCI Status
**1.0-beta.31.1.5 branch**: [![Build Status](https://secure.travis-ci.org/dalehenrich/metacello-work.png?branch=1.0-beta.31.1.5)](http://travis-ci.org/dalehenrich/metacello-work)
