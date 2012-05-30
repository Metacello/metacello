**ConfigurationOf** is the common superclass for all Metacello configurations.

To create a new Metacello configuration:

1. Create a subclass of the class ConfigurationOf appending the name of
   your project (don't forget to change the **category:** to match the
   name of the configuration class):

    ```Smalltalk
    ConfigurationOf subclass: #ConfigurationOfExample
      instanceVariableNames: ''
      classVariableNames: ''
      poolDictionaries: ''
      category: 'ConfigurationOfExample'
    ```

2. Create a **baselineXXXX:** method where you specify the structure of your project:

    ```Smalltalk
    baseline0100: spec
      <baseline: '1.0-baseline'>

      spec for: #common do: [
        spec repository: 'http://ss3.gemstone.com/ss/Example'.
        spec
          package: 'Example-Core';
          package: 'Example-Tests' with: [
            spec requires: 'Example-Core' ]].
    ```

3. Create a **versionXXXX:** method where you specify the specific
   versions of the packages to be loaded for this version:

    ```Smalltalk
    version01000: spec
      <version: '1.0' imports: #('1.0-baseline')>

      spec for: #common do: [
        spec blessing: #release.
        spec
          package: 'Example-Core' with: 'Example-Core';
          package: 'Example-Tests' with: 'Example-Tests' ].
    ```

