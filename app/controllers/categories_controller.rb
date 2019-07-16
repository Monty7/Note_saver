class CategoryController < ApplicationController
    get '/category' do
       # binding.pry
        @categories = Category.where(:user_id => current_user.id)
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
           # binding.pry
            category.user_id = current_user.id
            #current_user.categories << category
        #Somehow the association creates a new note everytime a category is created
        #Even if it's tied to the user through category's 'user_id', the category 
        #will still not display if it's not connected to one of user's notes.
        #save to database
            category.save
            redirect "/category/#{category.id}"
        end
    end

    get '/category/:id/edit' do
        @category = Category.find_by_id(params[:id])
        erb :"/categories/edit"
    end

    patch '/category/:id' do
        @category = Category.find_by_id(params[:id])
        @category.name = params[:category_name]
        @category.save

        redirect "/category/#{@category.id}"
    end

    delete '/category/:id/delete' do
       
        category = Category.find_by_id(params[:id])
        category.delete
        redirect "/category"
    end

end