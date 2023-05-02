class OrdersController < ApplicationController
  def create
    product = Product.find(params[:product_id])
    order = Order.create!(product: product, product_sku: product.sku, amount: product.price, state: 'pending', user: current_user)

    session = Stripe::Checkout::Session.create(
      payment_method_types: ['card'],
      line_items: [{
        price_data: {
          currency: 'brl',
          unit_amount: product.price_cents,
          product_data: {
            name: product.name,
            description: product.description,
            images: [product.photo],
          },
        },
        quantity: 1,
      }],
      mode: 'payment',
      success_url: "https://mariadomato.herokuapp.com/orders/#{order}",
    )

    order.update(checkout_session_id: session.id)
    redirect_to new_order_payment_path(order)
  end

  def show
    @order = current_user.orders.find(params[:id])
  end

end
