class Category < ActiveRecord::Base
    has_many :notes
    has_many :users_categories
    has_many :users, through: :users_categories
end