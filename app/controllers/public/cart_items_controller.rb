class Public::CartItemsController < ApplicationController

 def create
   @cart_item = current_customer.cart_items.build(cart_item_params)
   @cart_item.save
 end
 
  private
   def cart_item_params
     params.require(:cart_item).permit(:customer, :item, :amount)
   end
end
