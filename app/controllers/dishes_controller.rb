class DishesController < ApplicationController
    before_action :set_dish, only: [ :destroy ]
    before_action :set_dishes, only: [ :index, :create ]

  def index
    @dish = Dish.new
  end

  # def new; end

  def create
    @dish = Dish.new(dish_params)

    # [:color] is used to send the Tag for TAG_LIST
    @dish.tag_list.add(params[:dish][:color])

    @dish.save! if @dish.valid?

    render action: "index"
  end


  private

  def dish_params
    params.require(:dish).permit(:name, :price_cents, :color)
  end

  def set_dish
    @dish = Dish.find(params[:id])
  end

  def set_dishes
    @antipasti = Dish.tagged_with("antipasto")
    @primi     = Dish.tagged_with("primo")
    @secondi   = Dish.tagged_with("secondo")
    @contorni  = Dish.tagged_with("contorno")
    @dolci     = Dish.tagged_with("dolce")
    @bevande   = Dish.tagged_with("bevande")

    @dishes_count = {
      antipasti: @antipasti.count,
      primi: @primi.count,
      secondi: @secondi.count,
      contorni: @contorni.count,
      dolci: @dolci.count,
      bevande: @bevande.count
    }

    @dishes = [
      @antipasti,
      @primi,
      @secondi,
      @contorni,
      @dolci,
      @bevande
    ].flatten
  end
end
