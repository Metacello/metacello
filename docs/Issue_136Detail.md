#Issue 136 ... Explained

[Issue 136](https://github.com/dalehenrich/metacello-work/issues/136)
addresses the situation where a project that you are actively
developing  *requires* another project that you are actively
developing.

##Pre-bugfix

For example, let's say that your project (say **MyProject**)depends upon 
the **RB** project
and the *baseline* for your project looks like the following:

```Smalltalk
baseline: spec
  <baseline>
  spec
    for: #'common'
    do: [ 
      spec
        baseline: 'RB'
          with: [ 
              spec
                loads: #('AST-Core');
                repository: 'github://dalehenrich/rb:dev/repository' ].
      spec
        package: 'MyPackage'
          with: [ spec requires: #('RB') ]]
```

The above spec declares that the package **AST-Core** should be loaded
from the **github://dalehenrich/rb:dev/repository** repository.

However, if you are actively developing the **RB** project you will have
a *clone* of the project located in a *FileTree* repository on your local disk 
(say **filetree:///opt/git/rb/repository**).

Prior to this bugfix, every time you loaded **MyProject** with a
statement like the following:

```Smalltalk
Metacello image
  baseline: 'MyProject';
  load.
```

The package **AST-Core** would be loaded from **github://dalehenrich/rb:dev/
repository** and your local repository would be **ingored** and you would have 
to reload RB from your *FileTree* repository:

```Smalltalk
Metacello new
  baseline: 'RB';
  repository: 'filetree:///opt/git/rb/repository';
  load: 'AST-Core'.
```

###Metacello load conflicts

With the bugfix to Issue #136, you are given a measure of control over the 
situation. 

To start with, **Metacello** keeps track of the projects 
that are loaded into your image and during a load, if it determines that 
the *project specification* that is being loaded does not match the 
*project specification* that is currently loaded in the image a 
**MetacelloConflictingProjectError** is signalled and the load process 
is halted (before any packages are actually loaded).

If you want to avoid the **MetacelloConflictingProjectError** you can 
arrange to handle the **MetacelloAllowConflictingProjectUpgrade** and
choose to either **allow** or **disallow** the upgrade. Or you can use
the **onConflict:** option in the **Scripting API**.

###Example

Let's look at example where we are starting with an *empty* image,
before any of the project artifacts have been loaded.

We'll start by loading the **RB** project into the image using
the following xpression:

```Smalltalk
Metacello new
  baseline: 'RB';
  repository: 'filetree:///opt/git/rb/repository';
  load: 'AST-Core'.
```

We can trigger the  **MetacelloConflictingProjectError** by loading
**MyProject** using the following expression:

```Smalltalk
Metacello image
  baseline: 'MyProject';
  repository: 'filetree:///opt/git/MyProject/repository';
 load.
```

If we want to **disallow** the load using the incoming or new project
specification for the **RB** project, we use the following expression:

```Smalltalk
Metacello image
  baseline: 'MyProject';
  repository: 'filetree:///opt/git/MyProject/repository';
  onConflict: [:ex | 
    ex existingProjectRegistration projectName = 'RB'
      ifTrue: [
        "disallow load using new specification" 
        ex disallow ]
      ifFalse: [ ex pass ]];
  load.
```

The code makes sure that we're only reasoning about the **RB** project:

```Smalltalk
 ex existingProjectRegistration projectName = 'RB'
```

If you want to **allow** the use of the new project specification for the
**RB** project we use the following expression:

```Smalltalk
Metacello image
  baseline: 'MyProject';
  repository: 'filetree:///opt/git/MyProject/repository';
  onConflict: [:ex | 
    ex existingProjectRegistration projectName = 'RB'
      ifTrue: [
        "allow load using new specification" 
        ex allow ]
      ifFalse: [ ex pass ]];
  load.
```

If you liked the original behavior (i.e., new projects always win), then
you can get that behavior by using the following expression:

```Smalltalk
Metacello image
  baseline: 'MyProject';
  repository: 'filetree:///opt/git/MyProject/repository';
  onConflict: [:ex | ex allow ];
  load.
```

