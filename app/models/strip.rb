class Strip < ApplicationRecord
	validates :title, :image, presence: true
	
	has_and_belongs_to_many :tags
	has_one_attached :image
	extend FriendlyId
	friendly_id :title, use: [:slugged, :finders]

	def previous
		Strip.where(["id < ?", id]).order('id').last
	end
	def random
		Strip.where(["id != ?", id]).order_by_rand.first
	end
	def next
		Strip.where(["id > ?", id]).order('id').first
	end
	
end
