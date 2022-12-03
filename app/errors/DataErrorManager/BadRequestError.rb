module DataErrorManager
  class BadRequestError < ApplicationError

    def initialize(message)
      super(message, 400)
    end

  end
end
