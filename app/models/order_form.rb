class OrderForm
  include ActiveModel::Model
  attr_accessor :user_id,:item_id, :city,:buinding_name,:buinding_number,:phone_number,:postal_code,:prefecture_id,:house_number,:price
  
  with options presence:  true do
   validates :user_id
   validates :item_id
   validatas :phone_number, format: { with: /\A[0-9]{11}\z/, message: 'is invalid' }
   validates :price, numericality:{only_interger: true, greater_than_or_equal_to: 1,less_than_or_equal_to: 1000000,message: 'is invalid'}
   validates :city
   validates :postal_code, format:{with:/\A[0-9]{3}-[0-9]{4}\z/, message: "is invalid. Include hyphen(-)"}
  validates :prefecture_id,numericality:{other_than: 0,message:"can't be blank"}
  end

def save
  order=Order.create(user_id: user_id,item_id: item_id)
 
  Address.create(order_id: order.id,postal_code: postal_code,prefecture_id: prefecture_id,city: city,buinding_number: buinding_number,house_number: house_number,city :city)

  end

end