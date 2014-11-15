module CodenjoyConnection
  class Player
    def initialize(player)
      raise CodenjoyConnection::GenericError.new('Please, override #process_data in your player class.') unless player.respond_to?(:process_data)
      raise CodenjoyConnection::GenericError.new('Please, override #make_step in your player class.') unless player.respond_to?(:make_step)

      @player = player
    end

    def process_data(data)
      @player.process_data(data)
    end

    def make_step
      @player.make_step
    end
  end
end
