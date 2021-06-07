class RemoveImageFromPins < ActiveRecord::Migration[6.1]
  def up
    remove_column :pins, :image
  end

  def down
    add_column :pins, :image, :string
  end
end
