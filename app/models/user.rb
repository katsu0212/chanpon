class User < ApplicationRecord
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable, :trackable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :validatable
  has_many :rooms, through: :room_users
  has_many :room_users
  
  with_options presence: true do
    validates :name 
    validates :nickname
    validates :email
    validates :birthday
    validates :password
    validates :password_confirmation
  end
end
