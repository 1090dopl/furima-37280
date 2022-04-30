class Item < ApplicationRecord
  extend ActiveHash::Associations::ActiveRecordExtensions
  belongs_to :user
  has_one :purchases
  #has_many :comments
  has_one_attached :image

  belongs_to :prefecture
  belongs_to :status
  belongs_to :charge
  belongs_to :category
  belongs_to :day

  with_options presence: true do
    validates :user_id
    validates :explanation
    validates :image,presence:{ message:'Please paste the image'}
    validates :name,presence:{ message:'Please enter the name'}
    validates :status_id, numericality:{ other_than: 0, message:'Please select the  status'}
    validates :price,presence: { message:'Enter price'}
    validates :price, numericality:{ greater_than_or_equal_to:300,less_than_or_equal_to:9_999_999}
    validates :category_id, numericality:{ other_than: 0, message:'Please select a category'}  
    validates :charge_id ,numericality:{ other_than: 0, message:'Please select a charge'} 
    validates :day_id,  numericality:{ other_than: 0, message:'Please select a day'}
  end
end
  


