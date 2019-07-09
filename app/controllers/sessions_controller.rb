class SessionsController < ApplicationController
    get '/signup' do
        erb :'/users/signup'
    end

    get '/login' do
        erb :'/users/signin'
    end
end