class ApplicationController < ActionController::Base
  helper_method :current_user, :current_cart

  private

  def current_user
    @current_user ||= User.find_by(uid: session[:login_uid]) if session[:login_uid]
  end

  def current_cart
    if session[:cart_id]
      cart = Cart.find_by(id: session[:cart_id])
      unless cart
        cart = Cart.create
        session[:cart_id] = cart.id
      end
    else
      cart = Cart.create
      session[:cart_id] = cart.id
    end
    cart
  end
end