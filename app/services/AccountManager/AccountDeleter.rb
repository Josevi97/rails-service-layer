module AccountManager
  class AccountDeleter < ApplicationService

    def initialize(id)
      @id = id
    end

    def perform
      raise DataErrorManager::BadRequestError.new('Account not found') if !Account.exists?(id: @id)

      @account = Account.find(@id)
      @account.delete

      @account
    end

  end
end
