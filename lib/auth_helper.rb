# coding: UTF-8

module AuthHelper
  def sign_in(user)
    session[:user_id] = user.id
  end

  def user_sign_out
    session[:user_id] = nil
  end

  def user_signed_in?
    session[:user_id]
  end

  def authenticate_user!
    unless user_signed_in?
      redirect_to new_admin_session_path
    end
  end
end
