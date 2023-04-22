class Book < ApplicationRecord
  belongs_to :publisher
  has_many :book_authers, dependent: :destroy
  has_many :authers, through: :book_authers
end
