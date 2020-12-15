class ApplicationController < ActionController::Base
  protect_from_forgery with: :exception
  include SessionsHelper

  def authenticate_user
    if logged_in? == false
      flash[:notice] = ('ログインしてください')
      redirect_to new_session_path
    end
  end
end
