#SuperclassHash ![Build Status](http://travis-ci.org/piotrj/superclass_hash.png)](http://travis-ci.org/piotr/superclass_hash)

SuperclassHash is a hash that you could use if you are storing
values under class keys. If hash does not have particular class key
it would serach through superclasses and return the first available
value if any.

```ruby
require "superclass_hash"

class A
end

class B < A
end

superhash = SuperclassHash.new
superhash[A] = "a"
superhash[A] # => "a"
superhash[B] # => "b"
```


