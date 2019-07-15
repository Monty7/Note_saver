class Category < ActiveRecord::Base
    has_many :notes
   # belongs_to :user
   has_many :users
    #has_many :users, through: :notes

    # has_many :users_categories
    # has_many :users, through: :users_categories
end