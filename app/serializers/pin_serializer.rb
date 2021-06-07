class PinSerializer < ActiveModel::Serializer
  attributes :id, :title, :description, :image, :site_url, :user_id, :board_id

  def image
    if object.image.attached?
      {
        url: rails_blob_url(object.image),
      }
    end
  end
end
