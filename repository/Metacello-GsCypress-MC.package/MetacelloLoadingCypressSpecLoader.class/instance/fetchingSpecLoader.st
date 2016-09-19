accessing
fetchingSpecLoader
  ^ (MetacelloFetchingCypressSpecLoader on: self spec)
    loaderPolicy: self loaderPolicy copy;
    yourself
