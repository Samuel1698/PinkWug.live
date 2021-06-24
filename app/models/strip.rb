class Strip < ApplicationRecord
	validates :title, :image, :keywords, presence: true
	has_one_attached :image

	extend FriendlyId
	friendly_id :title, use: [:slugged, :finders]

	serialize :keywords, Array
	def keywords_raw
		self.keywords.join(", ") unless self.keywords.nil?
	end
	def keywords_raw=(values)
		self.keywords = []
		self.keywords=values.split(", ")
	end

	scope :filtered, ->(query_params) { Strip::Filter.new.filter(self,query_params)}
end