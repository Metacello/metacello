| filetreePath metacelloPath |
filetreePath := '/home/vagrant/filetree/repository'.
metacelloPath := '/home/vagrant/builds/dalehenrich/metacello-work/repository'.

Gofer new
    url: 'http://ss3.gemstone.com/ss/FileTree';
    package: 'ConfigurationOfFileTree';
    load.
((Smalltalk at: #ConfigurationOfFileTree) project version: '1.0') load.

Gofer new
    disablePackageCache;
    repository: (MCFileTreeRepository new directory: 
        (FileDirectory on: filetreePath));
    package: 'MonticelloFileTree-Core';
    load.


Gofer new
  squeaksource: 'MetacelloRepository';
  package: 'ConfigurationOfOSProcess';
  load.
((Smalltalk at: #'ConfigurationOfOSProcess') project version: #stable) load.

Gofer new
    disablePackageCache;
    repository: (MCFileTreeRepository new directory: 
                    (FileDirectory on: metacelloPath));
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
    disablePackageCache;
    repository: (MCFileTreeRepository new directory: 
                    (FileDirectory on: metacelloPath));
    package: 'Metacello-Reference';
    package: 'Metacello-TestsCore';
    package: 'Metacello-TestsMC';
    package: 'Metacello-TestsProfStef';
    package: 'Metacello-TestsReference';
    package: 'Metacello-TestsTutorial';
    load.

HDTestReport runPackages: #(
     'Metacello-TestsCore'
     "'Metacello-TestsMC'
     'Metacello-TestsProfStef'
     'Metacello-TestsReference'
     'Metacello-TestsTutorial'"
  ).

