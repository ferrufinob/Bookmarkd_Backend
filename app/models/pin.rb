class Pin < ApplicationRecord
  has_one_attached :image
  belongs_to :user
  belongs_to :board

  validates :title, :description, :site_url, :image, presence: true

  def userName
    self.user.username
  end
end
