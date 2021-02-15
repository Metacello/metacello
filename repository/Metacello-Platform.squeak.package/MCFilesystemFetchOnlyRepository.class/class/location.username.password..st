instance creation
location: locationUrl username: username password: password

	^ (self location: locationUrl)
		username: username password: password;
		yourself