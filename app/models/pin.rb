class Pin < ApplicationRecord
  belongs_to :user
  belongs_to :board
end

def board_attributes=(attribute)
  if !attribute[:name].blank?
    self.board = Board.find_or_create_by(attribute)
  end
end
