class ItemsController < ApplicationController
  before_action :authenticate_user!,only:[:index,:show]
  before_action :set_item,only:[:show,:edit,:update,:destroy]
  

  def index
    @items=Item.all
    @items=Item.order(created_at: :desc)
    
  end

  def new
    if user_signed_in?
       @item=Item.new
    else
      redirect_to user_session_path(@item.id)
  end
end

  def create
    @item=Item.new(item_params)
    if @item.save
     redirect_to items_path
    else
      render :new
    end
  end
 
 def show
  @item = Item.find(params[:id])
 end




 def edit
   if @item.user_id ==current_user.id&&@item.purchase.nil
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

end




