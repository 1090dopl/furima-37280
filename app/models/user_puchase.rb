class user_puchase
  include ActiveModel::Model
  attr_accessor :user_id,:item, :city,:buinding_name,:buinding_number,:phone_number,:postal_code,:prefecture_id,:house_number,:price
  
  with options presence: true true do
   validates :price, numericality:{only_interger: true, greater_than_or_equal_to: 1,less_than_or_equal_to: 1000000,message: 'is invalid'}
   validates :user_id
   validates :postal_code, format:{with:/\A[0-9]{3}-[0-9]{4}\z/, message: "is invalid. Include hyphen(-)"}
  end
  validates :prefecture,numericality:{other_than: 0,message:"can't be blank"}
end