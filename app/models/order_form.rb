class OrderForm
  include ActiveModel::Model
  attr_accessor :user_id,:item_id, :city,:building_name,:phone_number,:postal_code,:prefecture_id,:token,:house_number
  
  with_options presence:  true do
   validates :user_id
   validates :item_id
   validates :phone_number, format: { with: /\A[0-9]{11}\z/, message: 'is invalid' }
   validates :city
   validates :postal_code, format:{with:/\A[0-9]{3}-[0-9]{4}\z/, message: "is invalid. Include hyphen(-)"}
   validates :prefecture_id,numericality:{other_than: 0,message:"can't be blank"}
   validates :token
   validates :house_number
  end

def save
  order=Order.create(user_id: user_id,item_id: item_id)
 
  Address.create(order_id: order.id,postal_code: postal_code,prefecture_id: prefecture_id,city: city,building_name: building_name,house_number: house_number,phone_number: phone_number)

  end

end