class DishesController < ApplicationController
    before_action :set_dish, only: [:destroy]

  def index
    @dishes = Dish.all
  end

  def new
    @dish = @Dish.new
  end

  def create
    @dish = Dish.new(dish_params)

    if @dish.save
      redirect_to dishes_path
    else
      render dishes_path
    end
  end

  private

  def set_dish
    @dish = Dish.find(params[:id])
  end

  def dish_params
    params.require(:dish).permit(:name, :price_cents, :priority, :category, :tag_list)
  end
end
