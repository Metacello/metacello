#Load the whole enchilada

*Assuming Pharo1.3.*

###Clone the repository:

```shell
  sudo mkdir /opt/git/
  sudo chmod og+rw /opt/git/
  cd /opt/git/
  git clone https://github.com/dalehenrich/metacello-work
```

###Install in image:

```Smalltalk
Gofer new
      url: 'http://ss3.gemstone.com/ss/FileTree';
      package: 'ConfigurationOfFileTree';
      load.
    ((Smalltalk at: #ConfigurationOfFileTree) project version: '1.0') load.  

ConfigurationOfMetacello project updateProject.
ConfigurationOfMetacello project latestVersion load: 'ALL'.

Gofer new
        repository: (MCFileTreeRepository new directory: 
                    (FileDirectory on: '/opt/git/filetree/repository/'));
        package: 'MonticelloFileTree-Core';
        package: 'MonticelloFileTree-Tests';
        load.

Gofer new
  squeaksource: 'MetacelloRepository';
  package: 'ConfigurationOfOSProcess';
  load.
((Smalltalk at: #'ConfigurationOfOSProcess') project version: #stable) load.

Gofer new
    repository: (MCFileTreeRepository new directory: 
                    (FileDirectory on: '/opt/git/metacello-work/repository/'));
    package: 'Metacello-Base';
    package: 'Metacello-Core';
    package: 'Metacello-FileTree';
    package: 'Metacello-GitHub';
    package: 'Metacello-MC';
    package: 'Metacello-ToolBox';
    package: 'ConfigurationOfMetacello';
    package: 'BaselineOfMetacello';
    load.

Gofer new
    repository: (MCFileTreeRepository new directory: 
                    (FileDirectory on: '/opt/git/metacello-work/repository/'));
    package: 'Metacello-Reference';
    package: 'Metacello-TestsCore';
    package: 'Metacello-TestsMC';
    package: 'Metacello-TestsProfStef';
    package: 'Metacello-TestsReference';
    package: 'Metacello-TestsTutorial';
    package: 'ConfigurationOfGitMetacello';
    package: 'Metacello-TestsGitHub';
    load.

"I like my categories sorted"
SystemOrganization sortCategories.

Gofer new
    repository: (MCFileTreeRepository new directory: 
                (FileDirectory on: '/opt/git/external/repository/'));
    package: 'External-Core';
    package: 'External-Tests';
    package: 'BaselineOfExternal';
    load.

Gofer new
    repository: (MCFileTreeRepository new directory:
                (FileDirectory on: '/opt/git/pharo/ston/repository/'));
    package: 'Ston-Core';
    package: 'Ston-Tests';
    load.
```

