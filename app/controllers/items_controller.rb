class ItemsController < ApplicationController
  before_action :authenticate_user!,except:[:index]
  #before_action :set_item,only:[:show,:edit,:update,:destroy]
  

  def index
    @items=Item.all
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
 
 def edit
   #if @item.user_id !=current_user.id
   #else
    #redirect_to root_path
   end
  end

  

  private

  def item_params
    params.require(:item).permit(:name,:image,:explanation,:price,:category_id,:item_status_id,:charge_id,:prefecture_id,:day_id).merge(user_id:current_user.id)
  end

 # def set_item
   # @item=Item.find(params[:id])
 # end






