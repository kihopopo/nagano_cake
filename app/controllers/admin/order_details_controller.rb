class Admin::OrderDetailsController < ApplicationController
  def update
    @order_detail = OrderDetail.find(params[:id])
    if @order_detail.update(order_detail_params)
    if @order_detail.making_status == "making"
       @order_detail.order.update(status:"production")
    end

    @count = 0
    @order_detail.order.order_details.each do |order_detail|
    if order_detail.making_status == "completion"
       @count +=1
    else
      break
    end
    end
    if @count == @order_detail.order.order_details.count
       @order_detail.order.update(status:"preparing")
    end

    redirect_to admin_order_path(@order_detail.order)
    end

  end

   private

  def order_detail_params
  params.require(:order_detail).permit(:making_status, :amount)
  end

end
