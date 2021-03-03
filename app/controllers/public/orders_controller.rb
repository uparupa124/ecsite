class Public::OrdersController < ApplicationController

  def new
    @order = Order.new
    @current_customer = current_customer
    @current_customer_address = current_customer.addresses
  end

  def create
    @order = current_customer.orders.create(order_params)
    
    redirect_to complete_orders_path
  end

  def confirm
    @order = current_customer.orders.new(order_params)
    @order.details.build
    @cart_items = current_customer.cart_items
    
    if params[:order][:payment] == "1"
      @payment = "クレジットカード"
    elsif params[:order][:payment] == "2"
      @payment = "銀行振込"
    end

     if params[:order][:address_option] == "0"
        @order_postal_code = current_customer.postal_code
        @order_address = current_customer.address
        @order_name = current_customer.first_name + current_customer.last_name
     elsif params[:order][:address_option] == "1"
        @current_order = current_customer.addresses.find(params[:order][:address_id])
        @order_postal_code = @current_order.postal_code
        @order_address = @current_order.address
        @order_name = @current_order.name
     elsif params[:order][:address_option] == "2"
        @order_postal_code = @order.order_postal_code
        @order_address = @order.order_address
        @order_name = @order.order_name
     end
  end

  def complete
  end

  private
   def order_params
     params.require(:order).permit(:order_postal_code, :order_address, :order_name, :shipping, :total_amount, :payment, :order_telephone_number, details_attributes: [:order_price, :order_tax_price, :amount, :item_id, :order_id])
   end

   def detail_params
    # params.require(:detail).permit(:order_price, :order_tax_price, :amount, :item_id, :order_id)
   end
end
