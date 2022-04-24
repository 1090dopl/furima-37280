class User < ApplicationRecord
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :validatable
      
      #has_many :items
      #has_many :purchases
    
      
      PASSWORD_REGEX = /\A(?=.*?[a-z])(?=.*?[\d])[a-z\d]+\z/i.freeze
      validates :password,:password_confirmation,format:{with:PASSWORD_REGEX,message:'Include both letters and numbers'},presence: true,length:{minimum:6}
   
      with_options presence: true do
     validates :nickname,presence: true
     validates :first_name, presence: true
     validates :first_name,format:{with:/\A[ぁ-んァ-ン一-龥々-]+\z/}
     validates :last_name, presence: true
     validates :last_name,format:{with:/\A[ぁ-んァ-ン一-龥々-]+\z/}
     validates :last_name_kana, presence: true
     validates :last_name_kana, format:{with:/\A[ァ-ヶー－]+\z/}
     validates :first_name_kana, presence: true
     validates :first_name_kana,format:{with:/\A[ァ-ヶー－]+\z/}
     validates :birthday,presence: true
end
end
