class OrdersController < ApplicationController
  before_action :set_table, only: [:index, :create, :destroy, :update_table_amount, :create_order]

  after_action :update_table_amount #, on: update  #Or after_update :update_event_status

  def index
    @orders = Order.all
  end

  def create
    @order = Order.new(order_params)
    @order.table = @table

    # @table.update(total_amount_cents: new_total )

    @order.save

    respond_to do |format|
      format.html  { redirect_to @table, anchor: "order_dish_id_#{@order.id}" }
    end

  end

  def destroy
    order = Order.find(params[:id])
    order.destroy

    ChatroomChannel.broadcast_to(
      "general",
      "delete #{params[:id]}"
      # render_to_string(partial: "orders/order.html.erb", locals: { table: @table, order: order })
    )

    redirect_to @table
  end

  def update_table_amount
    new_total = @table.dishes.pluck(:price_cents).reduce(:+)
    @table.update_attributes(total_amount_cents: new_total)
  end

  def create_order
    order = Order.new
    order.table = @table
    order.dish = Dish.find(params["dish_id"].to_i)

    order.save

    ChatroomChannel.broadcast_to(
      "general",
      # "Ciao da ActionCable"
      render_to_string(partial: "orders/order.html.erb", locals: { table: @table, order: order })
    )

    render json: @table.orders, include: {dish: {only: [:id, :name, :color]}}
  end

  def delete_order
    puts "\n\n\n\n\n"
    p params
    puts "\n\n\n\n\n"
  end

  private

  def order_params
    params.require(:order).permit(:table_id, :dish_id)
  end

  def set_table
    @table = Table.find(params[:table_id])
  end

end
