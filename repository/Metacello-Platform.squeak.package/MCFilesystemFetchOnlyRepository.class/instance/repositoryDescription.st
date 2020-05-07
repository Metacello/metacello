accessing
repositoryDescription
  ^ self description , ' [' , self repositoryVersionString , ':'
    , self repositoryBranchName , ']'