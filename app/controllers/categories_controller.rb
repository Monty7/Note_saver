class CategoryController < ApplicationController
    get '/category' do

        @categories = Category.all
        erb :'categories/index'
    end

    get '/category/new' do
   
        erb :'categories/new'
    end

    get '/category/:id' do
        erb :"categories/#{params[:id]}"
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