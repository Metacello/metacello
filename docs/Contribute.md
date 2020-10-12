# How to Contribute to Metacello

The basic workflow is:

1. On GitHub, fork the Metacello repository.
2. In a git client, clone the Metacello repository to your local machine:
   ```terminal
   $ git clone git@github.com:YourName/metacello.git
   ```
3. Attach the clone to your working image using a `filetree://` path.
   
   In Squeak, this can be done by opening the Monticello Browser, clicking the "+Repository" button, and choosing the `filetree://` option.
   After that, add the Metacello repository to all loaded Metacello packages (yellow button menu on the filetree repository > "add to package...").  
   Note that this step requires the [FileTree](https://github.com/dalehenrich/filetree/) package already being installed.
4. Load Metacello from the filetree repository using the Metacello scripting API:
   ```smalltalk
   Metacello new
   	baseline: 'Metacello';
   	repository: 'filetree:///path/to/metacello/repository';
   	get.
   ```
5. Apply your awesome changes in your Smalltalk working copy!
6. Save your edits back to the filetree repository.
   
   In Squeak, this can be done by opening every modified Metacello package from the Monticello Browser and saving a new version on the filetree repository.
7. In the git client, commit & push your changes:
   ```terminal
   $ git commit -m"Description of your awesome changes"
   $ git push
   ```
8. Open a pull request ...
