class User < ActiveRecord::Base
    has_secure_password
    has_many :notes
  # has_many :categories
   has_many :categories, through: :notes
   
    # has_many :user_categories
    # has_many :categories, through: :users_categories
end