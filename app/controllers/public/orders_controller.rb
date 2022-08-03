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
    #@orders = Orders.all
  end

  def show
  end

  private

  def order_params
    params.require(:order).permit(:name, :postal_code, :address, :shipping_cost, :total_payment, :payment_method, :status)
  end
end
