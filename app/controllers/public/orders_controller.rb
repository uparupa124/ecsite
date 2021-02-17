class Public::OrdersController < ApplicationController
  
  def new
    @order = Order.new
  end
  
  def create
    @order = Order.new(order_params)
  end
  
  private
   def order_params
     params.require(:order).permit(:order_postal_code, :order_address, :order_name, :shipping, :total_amount, :payment, :order_telephone_number)
   end
end
