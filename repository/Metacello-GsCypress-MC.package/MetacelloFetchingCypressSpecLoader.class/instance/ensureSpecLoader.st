accessing
ensureSpecLoader
  ^ (MetacelloEnsureFetchingCypressSpecLoader on: self spec)
    loaderPolicy: self loaderPolicy;
    yourself	"explicitly share the loaderPolicy"