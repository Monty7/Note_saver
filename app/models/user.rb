class User < ActiveRecord::Base
    has_secure_password
    has_many :notes
    has_many :categories, through: :notes
end