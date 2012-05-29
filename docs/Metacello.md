# Metacello
**Metacello** is a package management system for Monticello-based
Smalltalk projects.
**Metacello** has a declarative *Specification Language* that is used to
define the *structure* and *versions* of a Monticello-based project.

A typical Monticello-based project is made up of several .mcz files that
need to be loaded in a specific order from a Monticello repository. The
project may also depend upon one or more external projects.
## Example Project
For example, the **Example project** has two packages: *Example-Core*
and *Example-Tests*, that are stored in the *http://www.example.com/Example*
repository. The *Example-Core* package was created using classes from
version **1.0** of the 
**Cool project** found in the *http://www.example.com/Cool* repository.
The *Example-Core* package needs to be loaded before the *Example-Tests*
package.

### Structure Specification
The **Cool project** is specified by the following statements:

```Smalltalk
spec
  project: 'Cool' with: [
    spec 
      version: '1.0';
      repository: 'http://www.example.com/Cool'].
```

The **with:** block is used to define specific properties for the **Cool
project**. In this case, the *version* and *repository* are being
specified for the **Cool** project.

The **Example-Core** package is specified by the following statements:

```Smalltalk
spec
  package: 'Example-Core' with: [
    spec requires: #('Cool')].
```

In this case, the **with:** block is used to define the list of
packages, groups
or projects that the *Example-Core* package **requires**. The entities
listed in the **requires:** statement are loaded **before** the
*Example-Core* package is loaded.

The **Example-Tests** package is specified by the following statements: 

```Smalltalk
spec
  package: 'Example-Tests' with: [
    spec requires: 'Example-Core' ].
```

The complete *structural specification* for the Example project looks
like the following:

```Smalltalk
spec
  project: 'Cool' with: [
    spec 
      version: '1.0';
      repository: 'http://www.example.com/Cool'].
spec
  package: 'Example-Core' with: [
    spec requires: #('Cool')];
  package: 'Example-Tests' with: [
    spec requires: 'Example-Core' ].
```

###Version Specification
