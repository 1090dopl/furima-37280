class Item < ApplicationRecord
  extend ActiveHash::Associations::ActiveRecordExtensions
  belongs_to :category
  belongs_to :status
  belongs_to :chrage
  belongs_to :prefecture
  belongs_to :ship_date
  has_one_attached :image
  belongs_to :user
  has_one :buy_record


  with_options presence: true do
    validates :image
    validates :name
    validates :price, numericality:{ greater_than_or_equal_to:300,less_than_or_equal_to:9_999_999}
    validates :category_id,  numericality:{ other_than: 1,message: "can't be blank"}
    validates :status_id,  numericality:{ other_than: 1,message: "can't be blank" }
    validates :charge_id,  numericality:{ other_than: 1,message: "can't be blank"}
    validates :prefecture_id, numericality:{ other_than: 1,message: "can't be blank"}
    validates :ship_date_id,  numericality:{ other_than: 1,message: "can't be blank"}
  end
end
