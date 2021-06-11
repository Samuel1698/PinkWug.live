class Tag < ApplicationRecord
	validates :title, presence: true

	has_many :strip_tags 
	has_many :strips, through: :strip_tags
end
