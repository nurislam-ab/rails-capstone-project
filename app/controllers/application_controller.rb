# ApplicationController
class ApplicationController < ActionController::Base
  include SessionsHelper

  private

  def require_login
    flash[:error] = 'You must be logged in to access this section'
    redirect_to login_path
    return unless logged_in?
  end
end
