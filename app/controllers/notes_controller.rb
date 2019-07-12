class NotesController < ApplicationController
    get '/notes' do
        if current_user
            @notes = current_user.notes
            erb :'/notes/index'
        else
            redirect '/login'
        end
    end

    get '/notes/new' do
        if !logged_in?
            redirect "/login"
        else
            @categories = Category.all
            erb :'/notes/new'
        end
    end

    get '/notes/:id' do
        @note = Note.find_by_id(params[:id])
        @category = Category.find_by_id(@note.category_id)

        erb :'/notes/show'
    end

    post '/notes' do
        @note = Note.new(params[:note])
        #@note = Note.create(params[:note])
        @note.user_id = session[:user_id]
        if @note.save
            #binding.pry
            #add the user id and category id
            redirect "/notes/#{@note.id}"
        else
            redirect "/notes/new"
        end
    end

    get '/notes/:id/edit' do
        @note = Note.find_by_id(params[:id])
        erb :"/notes/edit"
    end

    patch '/notes/:id' do
        @note = Note.find_by_id(params[:id])
        @note.title = params[:title]
        @note.content = params[:content]
        @note.save
        redirect "/notes/#{@note.id}"
    end

    delete '/notes/:id/delete' do
     
        @note = Note.find_by_id(params[:id])
        @note.delete
        redirect "/notes"
    end
end