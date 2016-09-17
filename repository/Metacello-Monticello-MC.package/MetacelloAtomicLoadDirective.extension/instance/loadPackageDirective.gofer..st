*metacello-monticello-mc
loadPackageDirective: aPackageLoadDirective gofer: aGofer
	"accumulate packages"
	
	self packageloads add: aPackageLoadDirective