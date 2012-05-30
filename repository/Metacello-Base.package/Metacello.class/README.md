**Metacello** is The entry point for the *Metacello Scripting API*.

Use the *Metacello Scripting API* to load projects into your image and to publish load instructions for your own projects.

The following expression will load **ConfigurationOfExample** configuration from the *http://ss3.gemstone.com/ss/Example* repository and then loads version **1.0** of the **Example project**:

```Smalltalk
Metacello new
  configuration: 'Example';
  version: '1.0';
  repository: 'http://ss3.gemstone.com/ss/Example';
  load.
```
