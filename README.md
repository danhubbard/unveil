# Unveil

A rack based web framework, an excercise to understand rails by building my own from scratch

## Installation

Add this line to your application's Gemfile:

    gem 'unveil'

And then execute:

    $ bundle

Or install it yourself as:

    $ gem install unveil

## Usage

### Get up and running

Create new directory of your project name with the following files

- Gemfile
- config.ru
- config/application.rb
- public/index.html

Add the unveil gem to your Gemfile:

```ruby
# Gemfile
source :rubygems
gem 'unveil', git: 'git://github.com/the-undefined/unveil.git'
```

Create a new Unveil application:

```ruby
# config/application.rb
require 'unveil'

module ProjectName
  class Application < Unveil::Application
  end
end
```

Set rack to use this application:

```ruby
# config.ru
require 'unveil'
run ProjectName::Application.new
```

### Add your first controller

Create a new controller:

```ruby
# app/controllers/my_controller.rb
class MyController < Unveil::Controller
  def message
    "Huston we have lift off!"
  end
end
```

Fire up the web app with ````rackup -p 3001```` and point your browser at [localhost:3001/my/message](http://localhost:3001/my/message),
and you'll see a message from outer space.

## Contributing

1. Fork it
2. Create your feature branch (`git checkout -b my-new-feature`)
3. Commit your changes (`git commit -am 'Add some feature'`)
4. Push to the branch (`git push origin my-new-feature`)
5. Create new Pull Request
