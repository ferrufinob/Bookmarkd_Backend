class User < ApplicationRecord
    has_many :boards
    has_many :pins
    
  has_secure_password
end
