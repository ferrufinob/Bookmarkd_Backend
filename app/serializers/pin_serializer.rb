class PinSerializer < ActiveModel::Serializer
  attributes :id, :title, :description, :image, :site_url, :user_id, :board_id
end
