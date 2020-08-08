class TablesController < ApplicationController
  before_action :set_table, only: [:show, :edit, :update]

  def index
    @tables = Table.order(:table_number)
  end

  def show
  end

  def edit;end

  def update
    @table.update(table_params)

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
