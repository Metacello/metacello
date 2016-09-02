*metacello-mc
authorName
  self globalNamed: #'Author' ifPresent: [ :cl | ^ cl perform: #'initials' ].
  ^ 'no developer initials'