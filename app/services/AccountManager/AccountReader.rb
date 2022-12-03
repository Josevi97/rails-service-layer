module AccountManager
  class AccountReader < ApplicationService

    def perform
      Account.all
    end

  end
end
