class OrdersController < ApplicationController
  before_action :set_table, only: [:index, :create, :destroy, :update_table_amount]

  after_action :update_table_amount #, on: update  #Or after_update :update_event_status

  def update_table_amount
    new_total = @table.dishes.pluck(:price_cents).reduce(:+)
    @table.update_attributes(total_amount_cents: new_total)
  end

  def index
    @orders = Order.all
  end

  def create
    @order = Order.new(order_params)
    @order.table = @table

    # @table.update(total_amount_cents: new_total )

    @order.save

    redirect_to @table, anchor: "order_dish_id_#{@order.id}"
  end

  def destroy
    order = Order.find(params[:id])
    order.destroy

    redirect_to @table
  end

  private

  def order_params
    params.require(:order).permit(:table_id, :dish_id)
  end

  def set_table
    @table = Table.find(params[:table_id])
  end

end
