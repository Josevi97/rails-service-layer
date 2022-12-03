class ApplicationController < ActionController::API

  def handle_request
    begin
      yield
      rescue ApplicationError => e
        render json: { error: e.message }, status: e.status
    end
  end

end
