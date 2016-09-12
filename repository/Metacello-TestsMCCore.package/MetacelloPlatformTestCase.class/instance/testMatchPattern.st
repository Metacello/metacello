tests
testMatchPattern
  | platform |
  platform := MetacelloPlatform current.
  self
    assert: (platform matchPattern: '#*@*.*' in: 'dale.henrichs@gemstone.com').
  self
    assert: (platform matchPattern: '#*@#*.#*' in: 'dale.henrichs@gemstone.com').
  self assert: (platform matchPattern: '*' in: 'zort').
  self assert: (platform matchPattern: '*baz' in: 'mobaz').
  self deny: (platform matchPattern: '*baz' in: 'mobazo').
  self assert: (platform matchPattern: '*baz*' in: 'mobazo').
  self deny: (platform matchPattern: '*baz*' in: 'mozo').
  self assert: (platform matchPattern: 'foo*' in: 'foozo').
  self deny: (platform matchPattern: 'foo*' in: 'bozo').
  self assert: (platform matchPattern: 'foo*baz' in: 'foo23baz').
  self assert: (platform matchPattern: 'foo*baz' in: 'foobaz').
  self deny: (platform matchPattern: 'foo*baz' in: 'foo23bazo').
  self assert: (platform matchPattern: 'foo' in: 'Foo').
  self deny: (platform matchPattern: 'foo*baz*zort' in: 'foobazort').
  self assert: (platform matchPattern: 'foo*baz*zort' in: 'foobazzort').
  self assert: (platform matchPattern: '*foo#zort' in: 'afoo3zortthenfoo3zort').
  self assert: (platform matchPattern: '*foo*zort' in: 'afoodezortorfoo3zort').	"$? allowed in pattern string - now"
  self deny: (platform matchPattern: '*foo?zort' in: 'afoo3zortthenfoo3zort')