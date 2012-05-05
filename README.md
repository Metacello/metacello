## HOW TO INSTALL

Note that the the git work has not even achieved alpha, yet, so don't 
bootstrap into an image that you care about:)

Assuming Pharo 1.3

### Install FileTree
follow [FileTree installation insructions][1]

### Clone the metacello repository:
```shell
  sudo mkdir /opt/git/
  sudo chmod og+rw /opt/git/
  cd /opt/git/
  git clone https://github.com/dalehenrich/metacello-work
```

### Attach to the metacello repository and load Metacello files that have changed for git
(assuming your stating with Metacello 1.0-beta.31.1)"

```Smalltalk
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
    load.
```

[1]: https://github.com/dalehenrich/filetree/blob/master/README.md
