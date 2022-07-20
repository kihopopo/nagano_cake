class Public::CustomersController < ApplicationController
  def create
  end
  
  def show
    @customer = Customer.find(params[:id])  
  end

  def edit
  end

  def quit
  end
  
   private
  
  def customer_params
    params.require(:customer).permit(:first_name, :last_name, :first_name_kana, :last_name_kana, :postal_code, :address, :telephone_number, :email, :is_deleted)
  end
end


