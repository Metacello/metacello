**BaselineOf** is the common superclass for all Metacello baselines.

A short description of why you would want to use a **BaselineOf**.

To create a new Metacello baseline

1. Create a subclass of the class BaselineOf appending the name of
   your project (don't forget to change the **category:** to match the
   name of the configuration class):

    ```Smalltalk
    BaselineOf subclass: #BaselineOfExample
      instanceVariableNames: ''
      classVariableNames: ''
      poolDictionaries: ''
      category: 'BaselineOfExample'
    ```

2. Create a **baseline:** method where you specify the structure of your project:

    ```Smalltalk
    baseline: spec
      <baseline>

      spec for: #common do: [
        spec
          package: 'Example-Core';
          package: 'Example-Tests' with: [
            spec requires: 'Example-Core' ]].
    ```

3. Create a Monticello package for your **BaselineOf** class and save it in the repository where your packages are stored.