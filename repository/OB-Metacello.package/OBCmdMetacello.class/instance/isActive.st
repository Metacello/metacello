testing
isActive
	^ ((target isKindOf: OBClassNode)
		and: [ requestor isSelected: target ])
			and: [ [ self selectedClass isMetacelloConfig ] on: Error do: [:ex | ex return: false] ]
