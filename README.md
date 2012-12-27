Client Exec
===========
A Ruby library for working with the [Client Exec API][].

[Client Exec API]: http://www.clientexec.com/documentation/api/licensedefender.php

Install
-------

    gem install client_exec
    bundle install

Configuration
-------------

```ruby
require 'client_exec'

ClientExec.config do |c|
  c.base_uri 'http://base.com/v1' # Root level URI for Client Exec API
  c.username 'user'               # Client Exec username
  c.password 'topsecret'          # Client Exec password
end
```

Usage
-----

View a license:

```ruby
license = ClientExec::License.new
license.get 'mydomain.com'
```

Add a license:

```ruby
license.add 'mydomain.com'
```

Delete a license:

```ruby
license.delete 'mydomain.com'
```

Tests
-----

ClientExec uses rspec for tests. To run:

    bundle exec rake

Error Handling
-------------

It always returns a Hash with a msg field that contains the error message.

```ruby
license.get 'domain.com'
{"error" => true, "msg" => "license does not exists"}

license.successful?
false
```

Supported Methods
-----------------

This gem implements the Client Exec license API v1.0.

It includes:

* *Add License.*
* *View License.*
* *Delete License.*

You're welcome to contribute and extend the client to support more API methods.

Note on Patches/Pull Requests
-----------------------------

* Fork the project.
* Make your feature addition or bug fix.
* Add tests for it. This is important so I don't break it in a
  future version unintentionally.
* Commit, do not mess with rakefile, version, or history.
  (if you want to have your own version, that is fine but bump version in a
  commit by itself I can ignore when I pull)
* Send me a pull request. Bonus points for topic branches.

Copyright
---------

Copyright (c) 2012 Site5.com. See LICENSE for details.
