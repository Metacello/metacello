private
bootstrapMetacelloFrom: repositoryUrl
	"Corresponds to version 1.0-beta.31.1.5"

	| minimumPackages |
	self ensureGoferVersion: 'Gofer-Core-lr.115' repositoryUrl: repositoryUrl.
	minimumPackages := OrderedCollection withAll: #(
		'Metacello-Base-DaleHenrichs.19'
		'Metacello-Core-dkh.468'
		'Metacello-MC-SeanDeNigris.534').
	self platformPackage ifNotNil: [ :pkg | minimumPackages add: pkg ].
	minimumPackages do: [ :pkg | self bootstrapPackage: pkg from: repositoryUrl ].