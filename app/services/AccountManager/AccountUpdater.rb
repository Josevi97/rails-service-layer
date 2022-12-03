module AccountManager
  class AccountUpdater < ApplicationService

    def initialize(id, params)
      @id = id;
      @params = params
    end

    def perform
      raise DataErrorManager::NotFoundError.new('Account not found') if !Account.exists?(id: @id)
      raise DataErrorManager::BadRequestError.new('Login must not be null') if !@params[:login]
      raise DataErrorManager::BadRequestError.new('Username must not be null') if !@params[:username]
      raise DataErrorManager::BadRequestError.new('Login already exists') if Account.exists?(login: @params[:login])

      @account = Account.find(@id)
      @account.login = @params[:login]
      @account.username = @params[:username]
      @account.save

      @account
    end

  end
end
