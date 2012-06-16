doits
testsMC10beta25PostLoadDoIt
	"reset test resources"
	
	#( 
		MetacelloAlternateResource
		MetacelloAtomicConfigurationResource
		MetacelloAtomicMonticelloResource
		MetacelloConfigurationResource
		MetacelloMonticelloResource
	) do: [:className | Smalltalk at: className ifPresent: [:cls | cls reset ]]