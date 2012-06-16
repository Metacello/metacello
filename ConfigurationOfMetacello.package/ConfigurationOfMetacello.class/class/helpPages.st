help
helpPages
	| pages |
	pages := {#helpIntro. #helpInstallation. #helpGettingStarted}.
	"include MetacelloHelp if installed"
	Smalltalk at: #MetacelloHelp ifPresent: [ :cl | pages :=  pages , {cl} ].
	^ pages