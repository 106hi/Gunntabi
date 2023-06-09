class Post < ApplicationRecord
  has_many_attached :image
  belongs_to :customer

  def get_image
    image.attached?
    image
  end
end
