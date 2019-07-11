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
        erb :'/users/signin'
        #redirect :'/notes'
    end

end