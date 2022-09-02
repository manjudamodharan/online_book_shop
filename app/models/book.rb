class Book < ApplicationRecord
  has_many :order_books
  has_many :orders, through: :order_books
end
