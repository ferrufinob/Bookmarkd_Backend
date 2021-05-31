class Pin < ApplicationRecord
  belongs_to :user
  belongs_to :board

  def board_name
    self.board.name
  end
end
