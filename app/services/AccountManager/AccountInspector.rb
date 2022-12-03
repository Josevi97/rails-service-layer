module AccountManager
  class AccountInspector < ApplicationService

    def initialize(id)
      @id = id
    end

    def perform
      raise DataErrorManager::NotFoundError.new('Account not found') if !Account.exists?(id: @id)

      Account.find(@id)
    end

  end
end
