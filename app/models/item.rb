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
    validates :category_id,  numericality:{ other_than: 1}
    validates :status_id,  numericality:{ other_than: 1 }
    validates :charge_id,  numericality:{ other_than: 1}
    validates :prefecture_id, numericality:{ other_than: 1}
    validates :ship_date_id,  numericality:{ other_than: 1}
  end
end
