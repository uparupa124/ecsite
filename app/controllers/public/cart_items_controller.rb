class Public::CartItemsController < ApplicationController
 
 def index
  @numbers = ["1", "2", "3", "4", "5", "6", "7", "8", "9", "10"]
  @cart_item = current_customer.cart_items
 end

 def create
   @cart_item = current_customer.cart_items.new(cart_item_params)
   @cart_item.save
   redirect_to cart_items_path
 end
 
 def update
  @cart_item = current_customer.cart_items.find_by(cart_item_params)
  @cart_item.update(cart_item_params)
  redirect_to cart_items_path
 end
 
 def destroy
  @cart_item = CartItem.find(params[:id])
  @cart_item.destroy
  redirect_to cart_items_path
 end
 
  private
   def cart_item_params
     params.require(:cart_item).permit(:amount, :item_id)
   end
end
