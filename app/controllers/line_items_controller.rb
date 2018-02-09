class LineItemsController < ApplicationController
  def create
    current_user.set_current_cart unless current_user.current_cart
    @cart = current_user.current_cart
    @cart.add_item(params[:item_id])
    @cart.save
    redirect_to cart_path(@cart)
  end
end
