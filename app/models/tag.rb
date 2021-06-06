class Tag < ApplicationRecord
	validates: :title

	has_and_belongs_to_many :strips
end
