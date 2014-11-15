require "codenjoy_connection/version"
require "codenjoy_connection/exceptions"
require "codenjoy_connection/player"

module CodenjoyConnection
  def self.prepare_url(opts = {})

    raise CodenjoyConnection::GenericError.new("Please, specify connection params.") if opts == {}

    host, port, username, player = opts[:host], opts[:port], opts[:username], opts[:player]
    game_url = opts[:game_url] ||'tetris-contest/ws?'

    raise CodenjoyConnection::GenericError.new("Please, specify a host for connection.") unless host
    raise CodenjoyConnection::GenericError.new("Please, specify a port for connection.") unless port
    raise CodenjoyConnection::GenericError.new("Please, specify a username for connection.") unless username

    @@url = "ws://#{host}:#{port}/#{game_url}user=#{username}"
  end

  def self.play(player, opts)
     url = prepare_url(opts)
     player = CodenjoyConnection::Player.new(player)
  end
end
