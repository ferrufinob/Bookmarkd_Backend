class PinSerializer < ActiveModel::Serializer
  include Rails.application.routes.url_helpers
  attributes :id, :title, :description, :image, :site_url, :user_id, :board_id

  def image
    if object.image.attached?
      rails_blob_url(object.image)
    end
  end
end
