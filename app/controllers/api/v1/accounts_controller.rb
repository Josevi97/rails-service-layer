class Api::V1::AccountsController < ApplicationController

  def index
    render json: AccountManager::AccountReader.perform
  end

  def show
    handle_request do
      render json: AccountManager::AccountInspector.perform(params[:id])
    end
  end

  def create
    handle_request do
      render json: AccountManager::AccountCreator.perform(params)
    end
  end

  def update
    handle_request do
      render json: AccountManager::AccountUpdater.perform(params[:id], params)
    end
  end

  def destroy
    handle_request do
      render json: AccountManager::AccountDeleter.perform(params[:id])
    end
  end

end
