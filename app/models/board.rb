class Board < ApplicationRecord
  belongs_to :user
  has_many :pins, dependent: :destroy

  validates :name, uniqueness: { scope: :user, message: " already exists for this board" }
  validates :name, presence: true
end
