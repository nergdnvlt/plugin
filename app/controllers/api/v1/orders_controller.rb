# frozen_string_literal: true

# External API Endpoint to Check Against Order Completed Webhook

class Api::V1::OrdersController < ApiController

  def create
    order_id = params[:events][0][:data][:order]
    order = Order.find_by(order_id: order_id)
    if order.active == false
      order.active = true
    end
    order.save!
    render json: order, status: 200
  end
end