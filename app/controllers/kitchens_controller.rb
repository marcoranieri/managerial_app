class KitchensController < ApplicationController
  def index
    @tables = Table.order(:table_number)
  end
end
