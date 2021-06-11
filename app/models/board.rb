class Board < ApplicationRecord
  belongs_to :user

  validates :name, uniqueness: { scope: :user, message: " already exists for this board" }
  validates :name, presence: true
end
