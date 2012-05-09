api
package: aString overrides: aBlock
    | spec |
    spec := self project packageSpec
        name: aString;
        yourself.
    self root packages add: spec.
    self constructor with: spec during: aBlock