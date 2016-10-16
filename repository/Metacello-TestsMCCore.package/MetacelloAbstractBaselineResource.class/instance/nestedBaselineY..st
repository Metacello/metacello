NestedX
nestedBaselineY: spec
  <baseline>
  spec for: #'native' do: [ spec
        for: #'common'
        do: [ spec description: 'MetacelloAbstractBaselineResource>>nestedBaselineY:'.
          spec package: 'Atomic-CoreX-One'.
          spec
            for: #'two'
            do: [ spec package: 'Atomic-CoreX-Two' with: [ spec requires: 'Atomic-CoreX-One' ] ] ] ].
  spec
    for: #'extension'
    do: [ spec for: #'common' do: [ spec package: 'Atomic-CoreX-Three' ] ]