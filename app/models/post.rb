class Post < ApplicationRecord
  has_many_attached :image
  belongs_to :customer

  def get_image
    if image.attached?
      image
    else
      'no_image_scenery_gray.jpeg'
    end
  end
end
