class Public::OrdersController < ApplicationController
  def new
    @order = Order.new
    @customer = current_customer
  end

  def create
    @order = Order.new(order_params)
    @order.customer_id = current_customer.id
    @order.save
    redirect_to orders_path
  end


  def index
    @orders = Order.all
  end

  def show
  end

  def confirm
    @cart_items = CartItem.all
    @order = Order.new(order_params)
    @order.payment_method = params[:order][:payment_method]
   if params[:order][:select_address] == "1"
    @order.postal_code = current_customer.postal_code
    @order.address = current_customer.address
    @order.name = current_customer.full_name
   elsif params[:order][:select_address] == "2"
    @address = Address.find(params[:order][:address_id])
    @order.postal_code = @address.postal_code
    @order.address = @address.address
    @order.name = @address.name
   end
  end

  private

  def order_params
  params.require(:order).permit(:payment_method, :postal_code, :address, :name)
  end
end
