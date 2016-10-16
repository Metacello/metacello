NestedX
nestedBaselineX: spec
  <baseline>
  spec for: #'native' do: [ spec
        for: #'common'
        do: [ spec description: 'MetacelloAbstractBaselineResource>>nestedBaselineX:'.
          spec package: 'Atomic-CoreX-One' ].
      spec
        for: #'extension'
        do: [ spec for: #'common' do: [ spec package: 'Atomic-CoreX-Three' ] ] ]