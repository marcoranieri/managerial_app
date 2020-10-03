class TablesController < ApplicationController
  before_action :set_table, only: [:show, :edit, :update]

  def index
    @tables = Table.order(:table_number)
  end

  def show
    @order = Order.new

    @antipasti = Dish.tagged_with("antipasto")
    @primi     = Dish.tagged_with("primo")
    @secondi   = Dish.tagged_with("secondo")
    @contorni  = Dish.tagged_with("contorno")
    @dolci     = Dish.tagged_with("dolce")
    @bevande   = Dish.tagged_with("bevande")


    @dishes = [
      @antipasti,
      @primi,
      @secondi,
      @contorni,
      @dolci,
      @bevande
    ].flatten
  end

  def edit;end

  def update
    @table.update(table_params)

    redirect_to table_path(@table)
  end

  def decrement_pax
    @table = Table.find(params[:table_id])
    @table.update(pax: (@table.pax - 1))

    redirect_to table_path(@table)
  end

  def increment_pax
    @table = Table.find(params[:table_id])
    @table.update(pax: @table.pax + 1)

    redirect_to table_path(@table)
  end

  private

  def table_params
    params.require(:table).permit(:pax, :active, :notes)
  end

  def set_table
    @table = Table.find(params[:id])
  end
end


# Car.order(
#   'status DESC,
#    updated_at DESC,
#    CASE WHEN status = 7 THEN 0
#         WHEN status = 4 THEN 1
#         ...
#         END'
# )

# Dish.joins(:tags)
# .order(
#   'name DESC,
#    updated_at DESC,
#    CASE WHEN status = 7 THEN 0
#         WHEN status = 4 THEN 1
#         ...
#         END'
# ).where("tags.name=?", 'antipasto')

# Dish.joins(:tags).order(
#   'tags.name DESC,
#    CASE WHEN tags.name = antipasto THEN 0
#    CASE WHEN tags.name = primo THEN 1
#    CASE WHEN tags.name = secondo THEN 2
#    CASE WHEN tags.name = dolce THEN 3
#    CASE WHEN tags.name = bevande THEN 4
#    CASE WHEN tags.name = vino THEN 5
#    END'
# )