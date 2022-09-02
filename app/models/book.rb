class Book < ApplicationRecord
  has_many :order_books
  has_many :orders, through: :order_books

  default_scope { where('is_deleted = 0') }

  def self.find_order(params)
    find(params[:id])
  end
end
