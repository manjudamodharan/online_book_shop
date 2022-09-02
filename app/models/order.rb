class Order < ApplicationRecord
  has_many :order_books
  has_many :books, through: :order_books

  accepts_nested_attributes_for :order_books
end
