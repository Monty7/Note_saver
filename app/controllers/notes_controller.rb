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
            #@categories = Category.all
            @user_categories = Category.where(:user_id => current_user.id)
           # binding.pry
            erb :'/notes/new'
        end
    end

    get '/notes/:id' do
        @note = Note.find_by_id(params[:id])
        @category = Category.find_by_id(@note.category_id)

        erb :'/notes/show'
    end

    get '/random_note' do
        if logged_in?
            notes = current_user.notes
            if !notes.empty?
                @note = current_user.notes.sample
                @category = Category.find_by_id(@note.category_id)
                erb :'/notes/show'
            else
                redirect '/notes/new'
            end
        else
            redirect "/login"
        end
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
        @user_categories = Category.where(:user_id => current_user.id)
   
        #or @user_categories = Category.find_by(:user_id => 1)
       #binding.pry
        erb :"/notes/edit"
    end

    patch '/notes/:id' do
        @note = Note.find_by_id(params[:id])
        @note.title = params[:note][:title]
        @note.content = params[:note][:content]
        @note.category_id = params[:note][:category_id]
        @note.save
            #@note.update(params[:note])
        redirect "/notes/#{@note.id}"
    end

    delete '/notes/:id/delete' do
     
        @note = Note.find_by_id(params[:id])
        @note.delete
        redirect "/notes"
    end
end