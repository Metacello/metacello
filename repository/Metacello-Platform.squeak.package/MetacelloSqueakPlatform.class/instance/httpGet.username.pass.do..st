private
httpGet: url username: username pass: pass do: aBlock

  | client response |
  client := WebClient new.
  username ifNotNil: [client username: username; password: [pass]].
  response := client httpGet: url do: [:req |
    ((username notNil or: [pass notNil]) and: [client server = 'api.github.com']) ifTrue: [
      "Workaround for GitHub API which requires manual authorization. See https://docs.github.com/en/free-pro-team@latest/rest/overview/resources-in-the-rest-api#authentication and http://forum.world.st/The-Inbox-WebClient-Core-ct-126-mcz-tp5123366p5123381.html for more information."
      "NB: Password authentication to the API is not supported. You must use an OAuth access token. See https://docs.github.com/en/free-pro-team@latest/rest/overview/other-authentication-methods#via-username-and-password for more information."
      req headerAt: 'Authorization' put: 'token ' , pass].
    aBlock cull: req].
  ^ response
    content;
    close