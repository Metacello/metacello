private
ensureCoreMetacello
    "Bootstrap Metacello and load the minimum support"

    self ensureMetacello: #('Metacello-Core')