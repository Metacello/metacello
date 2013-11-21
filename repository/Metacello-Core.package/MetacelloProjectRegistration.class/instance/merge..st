accessing
merge: aProjectRegistration
	" ... merge is done when a spec has been loaded into the image"

	self shouldBeMutable.
	aProjectRegistration validate.
	projectName := aProjectRegistration projectName.	"For now, just take the other registration's projectName, it is valid after all"
	self overwriteProjectSpecFromRegistration: aProjectRegistration