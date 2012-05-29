options api
upgradesAllowed
    ^ self options at: #'upgradesAllowed' ifAbsent: [ ^ false ]