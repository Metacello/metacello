accessing
loadingSpecLoader
  ^ (MetacelloLoadingCypressSpecLoader on: self spec)
    loaderPolicy: self loaderPolicy copy;
    yourself