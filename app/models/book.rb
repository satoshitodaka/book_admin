class Book < ApplicationRecord
  belongs_to :publisher
  has_many :book_authers, dependent: :destroy
  has_many :authers, through: :book_authers

  validates :name, presence: true, length: { maximum: 25 }
  validates :price, numericality: { greater_than_or_equal: 0 }
  validate do |book|
    if book.name.include?('exercise')
      book.errors[:name] << "I don't like exercise"
    end
  end
end
