class Pin < ApplicationRecord
  belongs_to :user
  belongs_to :board

  validates :title, :description, :image, :site_ur, presence: true
end
