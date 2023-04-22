class Book < ApplicationRecord
  belongs_to :publisher
  has_many :book_authers, dependent: :destroy
  has_many :authers, through: :book_authers

  validates :name, presence: true, length: { maximum: 25 }
  validates :price, numericality: { greater_than_or_equal: 0 }
  before_validation :add_lovely_to_cat
  validate do |book|
    if book.name.include?('exercise')
      book.errors[:name] << "I don't like exercise"
    end
  end

  enum sales_status: {
    reservation: 0, # 予約受付
    now_on_sale: 1, # 販売中
    end_of_sale: 2, # 販売終了
  }

  

  def add_lovely_to_cat
    self.name = self.name.gsub(/Cat/) do |matched|
      "lovely #{matched}"
    end
  end

  after_destroy do
    Rails.logger.info "Book is deleted: #{self.attributes}"
  end

  after_destroy :if => :hight_price? do
    Rails.logger.warn "Book with high price is deleted: #{self.attributes}"
    Rails.logger.warn "Please check!!"
  end

  def hight_price?
    price >+ 5000
  end


end
