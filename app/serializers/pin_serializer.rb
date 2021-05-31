class PinSerializer < ActiveModel::Serializer
  attributes :id, :title, :description, :image, :siteUrl, :user_id, :board_id, :boardName

  def siteUrl
    object.site_url
  end

  def boardName
    object.board_name
  end
end
