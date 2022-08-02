class Public::CartItemsController < ApplicationController
  def index
    @items = Item.all
    @cart_items = current_customer.cart_items
    #@total = @cart_items.inject(0){ |sum, item| sum +item.sum_of_price }
    @total= 0
  end
  
  def create
    @cart_item = CartItem.new(cart_item_params)
    @cart_item.customer_id = current_customer.id
    @cart_item.save
    redirect_to cart_items_path
  end


  def destroy
    @cart_item = CartItem.find(params[:id])
    @cart_item.destroy
    redirect_to '/cart_items'
  end

  def destroy_all
    current_customer.cart_items.destroy_all
    redirect_to '/cart_items'
  end

   private
  def cart_item_params
      params.require(:cart_item).permit(:item_id, :amount)
  end
end
