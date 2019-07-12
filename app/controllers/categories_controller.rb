class CategoryController < ApplicationController
    get '/category' do

        @categories = current_user.categories
        erb :'categories/index'
    end

    get '/category/new' do
        if logged_in?
            redirect "/login"
        else
            erb :'categories/new'
        end
    end

    get '/category/:id' do
        binding.pry
        #@notes = Note.where(:category_id => params[:id])
        @category = Category.find_by_id(params[:id])
        @category.notes
        erb :"categories/show"
    end

    post '/category' do
        
       # binding.pry
        if params[:category][:name] == ""
            redirect '/category'
        else
           
        #create category
            @category = Category.create(params[:category])
        
        #save to database
            redirect '/category'
        end
    end

end