class ItemsController < ApplicationController
  before_action :authenticate_user!,except:[:index,:show]
  before_action :set_item,only:[:show,:edit,:update,:destroy]
  before_action :item_order, only: :edit
  

  def index
    @items=Item.includes(:user).order(created_at: :desc)
    
  end

  def new
       @item=Item.new
end

  def create
    @item=Item.new(item_params)
    if @item.save
     redirect_to root_path
    else
      render :new
    end
  end
 
 def show
  
 end

 def update
  @item.update(item_params)
  if @item.valid?
    redirect_to item_path(item_params)
  else
    render 'edit'
 end
end



 def edit
  if @item.user_id == current_user.id && @item.order.nil?
  else  
    redirect_to root_path
  end
end
  
def destroy
  if @item.user_id == current_user.id
  @item.destroy
  redirect_to root_path
  else
  redirect_to root_path
  end
end


  private

  def item_params
    params.require(:item).permit(:name,:image,:explanation,:price,:category_id,:item_status_id,:charge_id,:prefecture_id,:day_id).merge(user_id:current_user.id)
  end

 def set_item
    @item=Item.find(params[:id])
 end
    
  def item_order 
    @item=Item.find(params[:id])   
    if @item.order
      redirect_to root_path
    end
  end
end