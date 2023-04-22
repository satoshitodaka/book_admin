class Auther < ApplicationRecord
  has_many :book_authers, dependent: :destroy
  has_many :books, through: :book_authers
end
