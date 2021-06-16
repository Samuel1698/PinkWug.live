class Strip < ApplicationRecord
	validates :title, :image, presence: true
	
	serialize :keywords, Array

	def keywords_raw
		self.keywords.join(", ") unless self.keywords.nil?
	end
	def keywords_raw=(values)
		self.keywords = []
		self.keywords=values.split(", ")
	end

	has_one_attached :image
	extend FriendlyId
	friendly_id :title, use: [:slugged, :finders]

end