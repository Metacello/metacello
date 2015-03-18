accessing
issue332Response2
  | curl |
  curl := 'curl -i https://api.github.com/repos/GsDevKit/gsApplicationTools/tags -H ''If-None-Match: "d1531b98e97e99e1ae6cc503149ae9f4"'''.
  ^ 'HTTP/1.1 304 Not Modified
Server: GitHub.com
Date: Wed, 18 Mar 2015 12:08:23 GMT
Status: 304 Not Modified
X-RateLimit-Limit: 60
X-RateLimit-Remaining: 58
X-RateLimit-Reset: 1426683127
Cache-Control: public, max-age=60, s-maxage=60
Last-Modified: Sat, 14 Feb 2015 21:49:04 GMT
ETag: "d1531b98e97e99e1ae6cc503149ae9f4"
X-XSS-Protection: 1; mode=block
X-Frame-Options: deny
Content-Security-Policy: default-src ''none''
Access-Control-Allow-Credentials: true
Access-Control-Expose-Headers: ETag, Link, X-GitHub-OTP, X-RateLimit-Limit, X-RateLimit-Remaining, X-RateLimit-Reset, X-OAuth-Scopes, X-Accepted-OAuth-Scopes, X-Poll-Interval
Access-Control-Allow-Origin: *
X-GitHub-Request-Id: 3235F557:51F0:279697B:55096AB7
Strict-Transport-Security: max-age=31536000; includeSubdomains; preload
X-Content-Type-Options: nosniff
Vary: Accept-Encoding
X-Served-By: 139317cebd6caf9cd03889139437f00b
'