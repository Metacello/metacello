accessing
setBlessing: anObject
      (anObject value == #structural and: [ blessing value notNil ]) ifTrue:[ ^self].
	blessing := anObject