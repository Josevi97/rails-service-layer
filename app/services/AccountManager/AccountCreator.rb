module AccountManager
  class AccountCreator < ApplicationService

    def initialize(params)
      @params = params
    end

    def perform
      raise DataErrorManager::BadRequestError.new('Login already exists') if Account.exists?(login: @params[:login])

      @account = Account.new(account_params)
      @account.save

      @account
    end

    private
      def account_params
        @params.require(:account).permit(:login, :username, :password)
      end

  end
end
