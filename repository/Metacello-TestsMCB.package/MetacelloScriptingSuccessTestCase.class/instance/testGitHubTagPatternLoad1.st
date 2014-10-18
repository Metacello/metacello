tests
testGitHubTagPatternLoad1
  "
3f9b964d7971ebbdf571c0eb7456075a4b3177f9 - 1.0-beta.32Tests
29efb3d9cb86da55402a543cbef5771e39f864e7 - v1.1.1-gs
0af534cea41d5ec22041b5e2bb45f4c48d58497e - v1.1.2-gs
dc2c23ebb4f6e95fe91de3203ba58decb25cb99b - v1.2.0-gs
ea79d81acf5dcc4143bdf6d437b6fa85dba5a271 - v1.2.0.1-gs
96cf2ed0a252ce55b7fd5ec4bedf3ad999ca6d23 - v1.2.0.2-gs
9e79d0e165bd51f7476d10a07968706f6034a6e6 - v1.3.0-gs
4fabb241ce2bf7e1f7468b8bef4a3d082ef1d0b9 - v2.1.0-gs
bea35be90ab1ba0be80af4f4275fccbfc071a74f - v2.2.0-gs
6ae699635ab41ab55219aea0595de208f4e44d27 - v3.0.0-gs
"

  [ 
  Metacello new
    baseline: 'External';
    repository: 'github://dalehenrich/external:v1.1.?/repository';
    get;
    load.
  self
    verify: 'External-Core'
    loadedFrom: 'github://dalehenrich/external:v1.1.2-gs/repository' ]
    on: Error
    do: [ :ex | 
      "keep an eye out for rate limiting errors from github for anonymous api usage"
      Transcript
        cr;
        show: 'testGitHubTagPatternLoad1: ' , ex description.
      (ex description includesSubstring: 'API rate limit exceeded')
        ifFalse: [ 
          "don't fail test because github rate limit exceeded"
          ex pass ] ]