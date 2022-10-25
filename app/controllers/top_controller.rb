class TopController < ApplicationController
  def main
    render 'main'
  end
  
  def login
    user = User.find_by(uid: params[:uid])
    if user
      login_password = BCrypt::Password.new(user.pass)
      if login_password == params[:pass] #←login_password.==(“my password”)
        session[:login_uid] = user.uid
        redirect_to root_path
      else
        render 'login'
      end
    end
  end
  
  def logout
    session.delete(:uid)
    redirect_to top_main_path
  end
end
