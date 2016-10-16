NestedX
nestedBaselineX: spec
  <baseline>
  spec
    for: #'common'
    do: [ spec description: 'MetacelloAbstractBaselineResource>>nestedBaselineX:'.
      spec for: #'native' do: [ spec package: 'Atomic-CoreX-One'.
          spec
            for: #'two'
            do: [ spec package: 'Atomic-CoreX-Two' with: [ spec requires: 'Atomic-CoreX-One' ] ] ].
      spec for: #'extension' do: [ spec package: 'Atomic-CoreX-Three' ] ]