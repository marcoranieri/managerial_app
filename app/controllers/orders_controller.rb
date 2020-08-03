class OrdersController < ApplicationController
  before_action :set_table, only: [:index]

  def index
    @orders = Order.all
  end

  private

  def set_table
    @table = Table.find(params[:table_id])
  end
end
