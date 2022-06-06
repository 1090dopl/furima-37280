class Item < ApplicationRecord
  extend ActiveHash::Associations::ActiveRecordExtensions
  belongs_to :user
  has_one :order
  has_many :comments
  has_one_attached :image

  belongs_to :prefecture
  belongs_to :item_status
  belongs_to :charge
  belongs_to :category
  belongs_to :day

  with_options presence: true do
    validates :user_id
    validates :explanation
    validates :image
    validates :name
    validates :item_status_id
    validates :price, numericality:{ with: /\A[0-9]+\z/,greater_than_or_equal_to:300,less_than_or_equal_to:9_999_999,message: 'is not a number'}
    validates :category_id  
    validates :charge_id 
    validates :day_id
    validates :prefecture_id
  end

  with_options numericality:{ other_than: 0} do
    validates :category_id
    validates :prefecture_id
    validates :item_status_id
    validates :charge_id
    validates :day_id



   # def images_number
     # errors.add(:images, "を1つ以上指定してください") if images.size < 1
    #end
  end
end 