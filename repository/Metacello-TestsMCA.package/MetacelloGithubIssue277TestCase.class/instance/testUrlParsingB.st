tests
testUrlParsingB
  "only have to use github://, since url parsing code is currently identical between bitbucket and github"

  {{'github://project/user:29efb3d9cb86da55402a543cbef5771e39f864e7/repository'.
  'github://project/user:29efb3d9cb86da55402a543cbef5771e39f864e7/repository'.
  'project/user'.
  '29efb3d9cb86da55402a543cbef5771e39f864e7'.
  'repository'}.
  {'github://project/user:v3.1.3-gs/repository'.
  'github://project/user:v3.1.3-gs/repository'.
  'project/user'.
  'v3.1.3-gs'.
  'repository'}.
  {'github://project/user:1.1.9/repository'.
  'github://project/user:1.1.9/repository'.
  'project/user'.
  'v3.1.3-gs'.
  'repository'}.
  {'github://project/user:v1.1.10/repository'.
  'github://project/user:v1.1.10/repository'.
  'project/user'.
  'v1.1.10'.
  'repository'}} do: [ :spec | self validate: spec ]