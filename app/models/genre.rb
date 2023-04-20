class Genre < ApplicationRecord
  
  has_many :users, dependent: :destroy
end
