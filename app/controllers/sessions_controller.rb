class SessionsController < ApplicationController
    get '/signup' do
       
        erb :'/users/signup'
        #redirect :'/login'

    end

    post '/signup' do
    
        if params[:user][:username] == "" || params[:user][:password] == "" || params[:user][:email] == ""

            redirect '/signup'
        else
            @user = User.create(params[:user])
            
            session[:user_id] = @user.id
            
            redirect '/notes'
        end

    end

    get '/login' do
   
        if logged_in?
            redirect :'/notes'
        else
           
           erb :'/users/signin'
            
        end
    end

    post '/login' do
    
        login(params[:username], params[:password])

        #located in helpers
    end

    get '/logout' do
        logout
    end

end