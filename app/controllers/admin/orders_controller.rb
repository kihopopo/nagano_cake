class Admin::OrdersController < ApplicationController
  def show
    @cart_items = current_customer.cart_items.all
    @order = Order.find(params[:id])
  end

  def update
    @order = Order.find(params[:id])
    @order.update(order_params)
    redirect_to admin_path(@order.id)
  end

  private

  def order_params
  params.require(:order).permit(:postal_code, :address, :name,:status)
  end

end
