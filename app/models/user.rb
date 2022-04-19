class User < ApplicationRecord
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :validatable
      
      has_many :items
      has_many :purchases
    
      
      PASSWORD_REGEX = /\A(?=.*?[a-z])(?=.*?[\d])[a-z\d]+\z/i.freeze
      validates :password,format:{with:PASSWORD_REGEX,message:'Include both letters and numbers'}
   
      with_options presence: true do
     validates :email, presence: true,format:{with:/[A-Za-z0-9._+]+@[A-Za-z]+.[A-Za-z]/},uniqueness: true
     validates :password,presence:true,length:{minimum:6}
     validates :encrypted_password, presence: true
     validates :nickname,presence: true, uniqueness:true
     validates :first_name, presence: true
     validates :first_name,format:{with:/\A[ぁ-んァ-ン一-龥]/}
     validates :last_name, presence: true
     validates :last_name,format:{with:/\A[ぁ-んァ-ン一-龥]/}
     validates :last_name_kana, presence: true
     validates :last_name_kana, format:{with:/\A[ぁ-んァ-ヶー－]+\z/}
     validates :first_name_kana, presence: true
     validates :first_name_kana,format:{with:/\A[ぁ-んァ-ヶー－]+\z/}
     validates :birthday,presence: true
end
end
