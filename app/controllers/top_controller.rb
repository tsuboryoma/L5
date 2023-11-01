class TopController < ApplicationController
  def main
    render "login"
  end

  def login
    if User.find_by(uid: params[:uid])
      user = User.find_by(uid: params[:uid])
      login_password = BCrypt::Password.new(user.pass)
      if login_password == params[:pass]
        session[:login_uid] = params[:uid]
        redirect_to tweets_path
      end
    else
      render "login"
    end
  end

  def logout
    session.delete(:login_uid)
    redirect_to root_path
  end
end
