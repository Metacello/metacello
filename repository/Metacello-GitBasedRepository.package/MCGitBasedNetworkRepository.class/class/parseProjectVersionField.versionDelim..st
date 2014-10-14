private
parseProjectVersionField: desc versionDelim: versionDelim
  "Issue #234: have to allow for commitish containing slashes"

  "From https://www.kernel.org/pub/software/scm/git/docs/git-check-ref-format.html:
    - They can include slash / for hierarchical (directory) grouping, but no slash-separated component can begin with a dot . or end with the sequence .lock.
    - They must contain at least one /. This enforces the presence of a category like heads/, tags/ etc. but the actual names are not restricted. If the --allow-onelevel option is used, this rule is waived.
    - They cannot have two consecutive dots .. anywhere.
    - They cannot have ASCII control characters (i.e. bytes whose values are lower than \040, or \177 DEL), space, tilde ~, caret ^, or colon : anywhere.
    - They cannot have question-mark ?, asterisk *, or open bracket [ anywhere. See the --refspec-pattern option below for an exception to this rule.
    - They cannot begin or end with a slash / or contain multiple consecutive slashes (see the --normalize option below for an exception to this rule)
    - They cannot end with a dot ..
    - They cannot contain a sequence @{.
    - They cannot contain a \.
"

  | strm done escaped repoDelim projectVersion repoPath |
  strm := WriteStream on: String new.
  repoDelim := versionDelim + 1.
  escaped := done := false.
  [ done ]
    whileFalse: [ 
      | char |
      repoDelim > desc size
        ifTrue: [ done := true ]
        ifFalse: [ 
          char := desc at: repoDelim.
          char == $\
            ifTrue: [ 
              escaped
                ifTrue: [ 
                  "$\ not legal in branch name ... literally ignored"
                  escaped := false ]
                ifFalse: [ escaped := true ] ]
            ifFalse: [ 
              char == $/
                ifTrue: [ 
                  escaped
                    ifFalse: [ done := true ] ].
              done
                ifFalse: [ strm nextPut: char ].
              escaped := false ].
          repoDelim := repoDelim + 1 ] ].
  repoDelim := repoDelim - 1.
  projectVersion := strm contents.
  repoPath := desc copyFrom: repoDelim + 1 to: desc size