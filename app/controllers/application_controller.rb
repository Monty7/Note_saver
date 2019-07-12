require './config/environment'

class ApplicationController < Sinatra::Base

  configure do
    set :public_folder, 'public'
    set :views, 'app/views'
    enable :sessions
    set :session_secret, 'enterpassword'
  end

  get "/" do
    erb :welcome
  end

  helpers do
    def logged_in?
      !!current_user
      #!!session[:email]
    end

    def login(username, password)
      user = User.find_by(:username => username)
      if user && user.authenticate(password)
       
        session[:user_id] = user.id
 
        redirect "/notes"
      else
        redirect "/signup"
      end
    end

    def current_user
      @current_user ||= User.find_by(:id => session[:user_id]) if session[:user_id]
    end

    def logout
      session.clear
      redirect "/login"
    end
  end

end
