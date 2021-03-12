class Admin::CustomersController < ApplicationController

 def index
   @customer = Customer.page(params[:page])
 end
 
 def show
   @customer = Customer.find(params[:id])
 end

 def edit
   @customer = Customer.find(params[:id])
 end
 
 def update
   @customer = Customer.find(params[:id])
   @customer.update!(customer_params)
   redirect_to admin_customers_path
 end
 
 private
 def customer_params
  params.require(:customer).permit(:first_name, :last_name, :first_name_kana, :last_name_kana, :postal_code, :address, :telephone_number, :email, :is_active)
 end
 
end
