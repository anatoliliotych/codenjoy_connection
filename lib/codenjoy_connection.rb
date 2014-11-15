require "codenjoy_connection/version"
require "codenjoy_connection/exceptions"
require "codenjoy_connection/player"
require 'eventmachine'
require 'faye/websocket'

module CodenjoyConnection
  def self.prepare_url(opts = {})

    raise CodenjoyConnection::GenericError.new("Please, specify connection params.") if opts == {}

    host, port, username, player = opts[:host], opts[:port], opts[:username], opts[:player]
    game_url = opts[:game_url] ||'tetris-contest/ws?'

    raise CodenjoyConnection::GenericError.new("Please, specify a host for connection.") unless host
    raise CodenjoyConnection::GenericError.new("Please, specify a port for connection.") unless port
    raise CodenjoyConnection::GenericError.new("Please, specify a username for connection.") unless username

    "ws://#{host}:#{port}/#{game_url}user=#{username}"
  end

  def self.play(player, opts)
     url = prepare_url(opts)
     player = CodenjoyConnection::Player.new(player)
     set_connection(player,url)
  end

  def self.set_connection(player,url)
    EM.run do
      ws = Faye::WebSocket::Client.new(url)
      ws.on :message do |event|
        p [:message, event.data]
        player.process_data(event.data)
        ws.send(player.make_step)
      end
    end
  end
end
