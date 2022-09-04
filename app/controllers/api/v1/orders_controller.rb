module Api
  module V1
    class OrdersController < ApplicationController
      before_action :set_page, only: [:index]

      # GET /api/v1/orders
      def index
        orders = Order.all.order(:status).limit(10).offset(@page * 10)
        render json: orders
      end

      # POST /api/v1/orders
      def create
        order = Order.new(order_params)
        if order.save
          render json: order
        else
          render json: {"error": "Could not create"}
        end
      end

      # GET /api/v1/orders/1
      def show
        order = Order.find_order(params)
        render json: order
      end

      # DELETE /api/v1/orders/1
      def destroy
        order = Order.find_order(params)
        order.update(status: 1)
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
