class User < ApplicationRecord
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :validatable
       
     validates :email, presence: true   
     validates :encrypted_password, presence: true,length:{minimum:6}
     validates :first_name, presence: true
     validates :first_name,format:{with:/\A[ぁ-んァ-ン一-龥]/}
     validates :last_name, presence: true
     validates :last_name,format:{with:/\A[ァ-ヶー－]+\z/}
     validates :last_name_kana, presence: true
     validates :last_name_kana, format:{with:/\A[ぁ-んァ-ン一-龥]/}
     validates :first_name_kana, presence: true
     validates :first_name_kana,format:{with:/\A[ァ-ヶー－]+\z/ }
     validates :nickname, presence: true
     validates :birthday, presence: true


 has_many :items
 has_many :purchase


end
