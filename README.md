# CodenjoyConnection

Gem handling ws connection and simple communication for numerous games in Codenjoy.

## Installation

Add this line to your application's Gemfile:

```ruby
gem 'codenjoy_connection'
```

And then execute:

    $ bundle

Or install it yourself as:

    $ gem install codenjoy_connection

## Usage

```ruby
    require 'codenjoy_connection'
    class Player
        def initialize
            # initialization of your user
        end

        def process_data(data)
            # logic for processing data  
        end
        def make_step
            # logic for making step
        end
    end

    player = Player.new
    opts = {:username => 'anatoli', :host=> 'localhost', :port => '8080', :game_url => 'codenjoy-contest/ws?'}
    CodenjoyConnection.play(player,opts)
```

## Contributing

1. Fork it ( https://github.com/anatoliliotych/codenjoy_connection/fork )
2. Create your feature branch (`git checkout -b my-new-feature`)
3. Commit your changes (`git commit -am 'Add some feature'`)
4. Push to the branch (`git push origin my-new-feature`)
5. Create a new Pull Request
