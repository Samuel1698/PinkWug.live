class Strip < ApplicationRecord
  validates :title, :image, presence: true

  has_one_attached :image

  extend FriendlyId
  friendly_id :title, use: [:slugged, :finders]

  attribute :keywords, :string, array: true
  def keywords_raw
    self.keywords.join(", ") unless self.keywords.nil?
  end
  def keywords_raw=(values)
    self.keywords = []
    self.keywords=values.split(", ")
  end

  def self.ransackable_attributes(auth_object = nil)
    %w[id title description transcript slug created_at updated_at]
  end

	def self.ransackable_associations(auth_object = nil)
    []
  end

  scope :filtered, ->(query_params) { Strip::Filter.new.filter(self,query_params)}
  #scope :filtered, ->(*args) {
  #  params = args.first.is_a?(Hash) ? args.first : {text: args.join(' ')}
  #  Strip::Filter.new.filter(self, params)
  #}
end