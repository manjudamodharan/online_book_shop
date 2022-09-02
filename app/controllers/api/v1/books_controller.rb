module Api
  module V1
    class BooksController < ApplicationController
      before_action :set_page, only: [:index]

      def index
        books = Book.where(allowded_search_attributes).order(sorting_condition).limit(10).offset(@page * 10)
        render json: books
      end

      def show
        book = Book.find(params[:id])
        render json: book
      end

      def create
        book = Book.new(book_params)
        if book.save
          render json: book
        else
          render json: {error: "Could not create"}
        end
      end

      def update
        book = Book.find(params[:id])
        book.update(available_copies: params[:available_copies])
      end

      def destroy
        book = Book.find(params[:id])
        book.update(is_deleted: 1)
        book.destroy
      end

      def order_history
        order_history = Book.includes(:orders).where(id: params[:id])
        render json: order_history
      end

      private

      def book_params
        params.require(:books).permit(:name, :price, :author, :year,:available_copies)
      end

      def set_page
        @page = params[:page] || 0
      end

      def sorting_condition
        allowed_sorts = [:name, :price, :author, :year]
        params[:sort] = (params[:sort].present? && (allowed_sorts.include? params[:sort].to_sym)) ? params[:sort] : 'name'
        params[:direction] = params[:direction].present? ? params[:direction] : 'asc'
        "#{params[:sort]} #{params[:direction]}"
      end

      def allowded_search_attributes
        provided_search_attr = params[:books]
        @operatable_fields = {
          name: provided_search_attr[:name],
          author: provided_search_attr[:author]
        }
        @operatable_fields.select {|_, value| value.present?}
      end
    end
  end
end
