tests
test002

	| version foo fan wc |
	gofer
		package: 'MetacelloTestConfigurationOfFan'; 
		package: 'MetacelloTestConfigurationOfFoo'; 
		load.
	fan := (Smalltalk at: #MetacelloTestConfigurationOfFan) new project.
	foo := (Smalltalk at: #MetacelloTestConfigurationOfFoo) new project.

	version := foo version: '5.0'.
	version load: #( 'GoferBar' 'GoferFaux').

	"load older version of 1 package (that doesn't match spec of earlier version)"
	gofer
		version: 'GoferFaux-tg.33'; 
		load.

	version := fan version: '2.0'.
	self flag: 'revisit this'.
	"self 
		should: [ version load: 'Foo' ]
		raise: MetacelloProjectSpecLoadConflict"
	version load: 'Foo'

