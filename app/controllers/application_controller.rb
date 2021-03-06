class ApplicationController < ActionController::Base
  protect_from_forgery with: :null_session
  protected
  def authenticate_user!
    if !usuario_signed_in?
      redirect_to new_usuario_session_path
    end
  end
end

