class Article < ApplicationRecord
  extend ActiveHash::Associations::ActiveRecordExtensions
    belongs_to :category

    validates :image,:name,:text,:cotegory,:status,:price,:charge,:explanation,presence: true
    
end
