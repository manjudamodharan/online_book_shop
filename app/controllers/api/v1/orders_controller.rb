module Api
  module V1
    class OrdersController < ApplicationController
      before_action :set_page, only: [:index]

      def index
        orders = Order.all.order(:user_id).limit(10).offset(@page * 10)
        render json: orders
      end


      def create
        order = Order.new(order_params)
        if order.save
          render json: order
        else
          render json: {"error": "could not create"}
        end
      end

      def show
        order = Order.find(params[:id])
        render json: order
      end

      def update
        order = Order.find(params[:id])
        order.update(copies: params[:copies])
      end

      def destroy
        order = Order.find(params[:id])
        order.update(status: 'cancelled')
      end


      private

      def order_params
        params.require(:orders).permit(:receipient_email, :receipient_address,
                                       :receipient_contact_number,:expected_delivery_date,
                                       :comments, :invoice_number,
                                       :total_charge, :status,
                                       order_books_attributes:[:book_id,:no_of_copies])
      end

      def set_page
        @page = params[:page] || 0
      end
    end
  end
end
