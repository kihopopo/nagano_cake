class Public::CustomersController < ApplicationController
  def create
  end
  
  def show
    @customer = current_customer
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


