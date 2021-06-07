class Strip < ApplicationRecord
	validates :title, :image, presence: true
	
	has_and_belongs_to_many :tags
	has_one_attached :image
	extend FriendlyId
	friendly_id :title, use: [:slugged, :finders]

	
end