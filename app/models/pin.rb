class Pin < ApplicationRecord
  has_one_attached :image
  belongs_to :user
  belongs_to :board

  validates :title, :description, :image, :site_url, presence: true
end
