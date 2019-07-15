class CategoryController < ApplicationController
    get '/category' do

        @categories = current_user.categories
        erb :'categories/index'
    end

    get '/category/new' do
        if !logged_in?
            redirect "/login"
        else
            erb :'/categories/new'
        end
    end

    get '/category/:id' do
       # binding.pry
        #@notes = Note.where(:category_id => params[:id])
        @category = Category.find_by_id(params[:id])
        @category.notes
        erb :"categories/show"
    end

    post '/category' do
        
        
        if params[:category][:name] == ""
            redirect '/category/new'
        else
           
        #create category
            category = Category.new(params[:category])
            current_user.categories << category
        #Somehow the association creates a new note everytime a category is created
        #save to database
            category.save
            redirect '/category'
        end
    end

end