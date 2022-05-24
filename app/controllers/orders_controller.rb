class OrdersController < ApplicationController
   before_action :authenticate_user!


  def index
    @order = OrderForm.new
  end

  def create
    @order = OrderForm.new(order_params)
    if @order_form.valid?
      @order_form.save
       return redirect_to root_path
    else
      render 'index'
    end
  end

  private
   
  def order_params
    params.require(:order).permit(:price,:postal_code,:prefecture,:city,:house_number,:building_name).merge(user_id: current_user.id)
  end

end