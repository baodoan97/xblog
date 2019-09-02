class Post < ApplicationRecord
	belongs_to :user
	has_many :comments, dependent: :destroy
	validates :title, presence: true, length: {minimum: 16, maximum: 150}
	validates :content, presence: true
end