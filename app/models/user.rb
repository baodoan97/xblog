class User < ApplicationRecord
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable, :trackable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :validatable
  validates :username, presence: true, length: {minimum: 6, maximum: 12}, uniqueness: true

  validates :first_name, presence: true, length: {minimum: 2, maximum: 10}

  validates :last_name, presence: true, 	length: {minimum: 2, maximum: 10}
end
