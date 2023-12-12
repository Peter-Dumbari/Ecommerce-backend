class Photo < ApplicationRecord
  belongs_to :product

  validates :image_url, presence: true, format: { with: URI::DEFAULT_PARSER.make_regexp }
end
