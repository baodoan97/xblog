class Post < ApplicationRecord
	belongs_to :user
	has_many :comments, dependent: :destroy
	validates :title, presence: true, length: {minimum: 3, maximum: 50}
	validates :content, presence: true
end