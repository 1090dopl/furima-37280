class User < ApplicationRecord
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :validatable
       
     validates :email, presence: true   
     validates :encrypted_password, presence: true
     validates :first_name, presence: true
     validates :last_name, presence: true
     validates :last_name_reading, presence: true
     validates :first_name_reading, presence: true
     validates :nickname, presence: true
     validates :birthday, presence: true

 has_many :items
 has_many :purchase


end
