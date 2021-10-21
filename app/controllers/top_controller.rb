class TopController < ApplicationController
  def main
    if session[:login_uid]
      render 'main'
    else session
      render 'login'
    end
  end
  
  def login
  user = User.find_by(uid: params[:uid])
    if user and BCrypt::Password.new(user.pass) == params[:pass]
      session[:login_uid] = user.uid
    p "ログイン出来ました"
      redirect_to root_path
    else
    p "ログイン出来ませんでした"
      render 'login'
    end
  end
  
  def logout
    session.delete(:login_uid)
    redirect_to root_path
  end
end
