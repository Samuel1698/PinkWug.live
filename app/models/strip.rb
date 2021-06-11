class Strip < ApplicationRecord
	validates :title, :image, presence: true
	
	has_many :strip_tags 
	has_many :tags, through: :strip_tags
	accepts_nested_attributes_for :strip_tags, allow_destroy: true

	has_one_attached :image
	extend FriendlyId
	friendly_id :title, use: [:slugged, :finders]

end