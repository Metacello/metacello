testing
isActive
    ^ ((target isKindOf: OBClassNode) and: [ requestor isSelected: target ])
        and: [ 
            [ self selectedClass isMetacelloConfig or: [ self selectedClass inheritsFrom: ConfigurationOf ] ]
                on: Error
                do: [ :ex | ex return: false ] ]