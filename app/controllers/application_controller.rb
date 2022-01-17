class ApplicationController < ActionController::API
  private

  def bad_request
    head :bad_request
  end
end
