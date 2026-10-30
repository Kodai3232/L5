class CartItemsController < ApplicationController
  def new
    @product = Product.find(params[:product_id])
    @cart_item = CartItem.new
  end

  def create
    @cart_item = current_cart.cart_items.build(cart_item_params)
    if @cart_item.save
      redirect_to cart_path(current_cart), notice: "カートに商品を追加しました。"
    else
      render :new, status: :unprocessable_entity
    end
  end

  def destroy
    @cart_item = CartItem.find(params[:id])
    @cart_item.destroy
    redirect_to cart_path(current_cart), notice: "カートから商品を削除しました。"
  end

  private

  def cart_item_params
    params.require(:cart_item).permit(:qty, :product_id)
  end
end