class Public::CartItemsController < ApplicationController
  def index
    @items = Item.all
    @cart_items = Cart_item.all
    #@cart_items =current_customer.cart_items.all
    #@total = @cart_items.inject(0){ |sum, item| sum +item.sum_of_price }
  end
  
  








   private
  def cart_item_params
      params.require(:cart_item).permit(:item_id, :amount)
  end
end
