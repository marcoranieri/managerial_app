class CustomersController < ApplicationController
  def index
  end

  def customer_params
    params.require(:customer).permit(:tag_list) ## Rails 4 strong params usage
  end
end
