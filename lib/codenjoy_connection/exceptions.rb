module CodenjoyConnection
  class GenericError < StandardError
    def initialize(msg)
      super(msg)
    end
  end
end
