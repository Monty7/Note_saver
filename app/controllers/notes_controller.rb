class NotesController < ApplicationController
    get '/notes' do
        @Notes = Note.all
        erb :'/notes/index'
    end

    get '/notes/new' do
        @categories = Category.all
        erb :'/notes/new'
    end

    get '/notes/:id' do
        @note = Note.find_by_id(params[:id])
        erb :'/notes/show'
    end

    post '/notes' do
        @note = Note.create(params[:note])
        @note.user_id = session[:user_id]
        binding.pry
        #add the user id and category id
        redirect "/notes/#{@note.id}"
    end
end