accessing
issue332Response4
  | curl |
  curl := 'curl -i https://api.github.com/repos/GsDevKit/gsApplicationTools/tags -H ''If-None-Match: "1234"'''.
  ^ 'HTTP/1.1 200 OK
Server: GitHub.com 
Date: Wed, 18 Mar 2015 13:16:14 GMT
Content-Type: application/json; charset=utf-8
Content-Length: 2936
status: 200 OK
X-Ratelimit-Limit: 60
X-Ratelimit-Remaining: 59
X-Ratelimit-Reset: 1426688174
Cache-Control: public, max-age=60, s-maxage=60
Last-Modified: Sat, 14 Feb 2015 21:49:04 GMT
ETag: "d1531b98e97e99e1ae6cc503149ae9f4"
Vary: Accept
X-GitHub-Media-Type: github.v3
X-XSS-Protection: 1; mode=block
X-Frame-Options: deny
Content-Security-Policy: default-src ''none''
Access-Control-Allow-Credentials: true
Access-Control-Expose-Headers: ETag, Link, X-GitHub-OTP, X-Ratelimit-Limit, X-Ratelimit-Remaining, X-Ratelimit-Reset, X-OAuth-Scopes, X-Accepted-OAuth-Scopes, X-Poll-Interval
Access-Control-Allow-Origin: *
X-GitHub-Request-Id: 3235F557:51F5:E069522:55097A9E
Strict-Transport-Security: max-age=31536000; includeSubdomains; preload
X-Content-Type-Options: nosniff
Vary: Accept-Encoding
X-Served-By: 2811da37fbdda4367181b328b22b2499

[
  {
    "name": "v1.0.6",
    "zipball_url": "https://api.github.com/repos/GsDevKit/gsApplicationTools/zipball/v1.0.6",
    "tarball_url": "https://api.github.com/repos/GsDevKit/gsApplicationTools/tarball/v1.0.6",
    "commit": {
      "sha": "12b53f9ea4bf8174bbe9a9717d0f9204a59e4078",
      "url": "https://api.github.com/repos/GsDevKit/gsApplicationTools/commits/12b53f9ea4bf8174bbe9a9717d0f9204a59e4078"
    }
  },
  {
    "name": "v1.0.5",
    "zipball_url": "https://api.github.com/repos/GsDevKit/gsApplicationTools/zipball/v1.0.5",
    "tarball_url": "https://api.github.com/repos/GsDevKit/gsApplicationTools/tarball/v1.0.5",
    "commit": {
      "sha": "eec8f9629b7bdfd5bedaa110514511c911f2ab6f",
      "url": "https://api.github.com/repos/GsDevKit/gsApplicationTools/commits/eec8f9629b7bdfd5bedaa110514511c911f2ab6f"
    }
  },
  {
    "name": "v1.0.4",
    "zipball_url": "https://api.github.com/repos/GsDevKit/gsApplicationTools/zipball/v1.0.4",
    "tarball_url": "https://api.github.com/repos/GsDevKit/gsApplicationTools/tarball/v1.0.4",
    "commit": {
      "sha": "577953c922a352db4637296c6ce4ebaaea6e028e",
      "url": "https://api.github.com/repos/GsDevKit/gsApplicationTools/commits/577953c922a352db4637296c6ce4ebaaea6e028e"
    }
  },
  {
    "name": "v1.0.3",
    "zipball_url": "https://api.github.com/repos/GsDevKit/gsApplicationTools/zipball/v1.0.3",
    "tarball_url": "https://api.github.com/repos/GsDevKit/gsApplicationTools/tarball/v1.0.3",
    "commit": {
      "sha": "9320fab4d356a3644d0ae89f6db1dd1488e54df8",
      "url": "https://api.github.com/repos/GsDevKit/gsApplicationTools/commits/9320fab4d356a3644d0ae89f6db1dd1488e54df8"
    }
  },
  {
    "name": "v1.0.2",
    "zipball_url": "https://api.github.com/repos/GsDevKit/gsApplicationTools/zipball/v1.0.2",
    "tarball_url": "https://api.github.com/repos/GsDevKit/gsApplicationTools/tarball/v1.0.2",
    "commit": {
      "sha": "b5755dc33c53a775711141e810b5c1f56bee9158",
      "url": "https://api.github.com/repos/GsDevKit/gsApplicationTools/commits/b5755dc33c53a775711141e810b5c1f56bee9158"
    }
  },
  {
    "name": "v1.0.1",
    "zipball_url": "https://api.github.com/repos/GsDevKit/gsApplicationTools/zipball/v1.0.1",
    "tarball_url": "https://api.github.com/repos/GsDevKit/gsApplicationTools/tarball/v1.0.1",
    "commit": {
      "sha": "a04be130ceb29541a12befa0fb1a3c19d07db33c",
      "url": "https://api.github.com/repos/GsDevKit/gsApplicationTools/commits/a04be130ceb29541a12befa0fb1a3c19d07db33c"
    }
  },
  {
    "name": "v1.0.0",
    "zipball_url": "https://api.github.com/repos/GsDevKit/gsApplicationTools/zipball/v1.0.0",
    "tarball_url": "https://api.github.com/repos/GsDevKit/gsApplicationTools/tarball/v1.0.0",
    "commit": {
      "sha": "12f6d533dc9d3ea43e51a29d87f2063b6b5aaea5",
      "url": "https://api.github.com/repos/GsDevKit/gsApplicationTools/commits/12f6d533dc9d3ea43e51a29d87f2063b6b5aaea5"
    }
  }
]
'