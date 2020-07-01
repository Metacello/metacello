accessing
issue332Response3
  | curl |
  curl := 'curl -i https://api.github.com/repos/GsDevKit/gsApplicationTools/tags -H "If-Modified-Since: Sat, 14 Feb 2015 21:49:04 GMT"'.
  ^ 'HTTP/1.1 304 Not Modified
Server: GitHub.com
Date: Wed, 18 Mar 2015 12:12:58 GMT
status: 304 Not Modified
X-Ratelimit-Limit: 60
X-Ratelimit-Remaining: 58
X-Ratelimit-Reset: 1426683127
Cache-Control: public, max-age=60, s-maxage=60
Last-Modified: Sat, 14 Feb 2015 21:49:04 GMT
X-XSS-Protection: 1; mode=block
X-Frame-Options: deny
Content-Security-Policy: default-src ''none''
Access-Control-Allow-Credentials: true
Access-Control-Expose-Headers: ETag, Link, X-GitHub-OTP, X-Ratelimit-Limit, X-Ratelimit-Remaining, X-Ratelimit-Reset, X-OAuth-Scopes, X-Accepted-OAuth-Scopes, X-Poll-Interval
Access-Control-Allow-Origin: *
X-GitHub-Request-Id: 3235F557:730C:A705B4C:55096BC9
Strict-Transport-Security: max-age=31536000; includeSubdomains; preload
X-Content-Type-Options: nosniff
Vary: Accept-Encoding
X-Served-By: 8dd185e423974a7e13abbbe6e060031e
'