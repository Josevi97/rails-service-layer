module DataErrorManager
  class NotFoundError < ApplicationError

    def initialize(message)
      super(message, 404)
    end

  end
end
