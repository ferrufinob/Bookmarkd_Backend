class PinSerializer < ActiveModel::Serializer
  attributes :id, :title, :description, :image, :siteUrl, :user_id, :board_id

  def siteUrl
    object.site_url
  end
end
