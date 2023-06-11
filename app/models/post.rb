class Post < ApplicationRecord
  has_many_attached :image
  belongs_to :customer

  def get_image
    unless image.attached?
      file_path = Rails.root.join('app/assets/images/no_image_scenery_gray.jpeg')
      image.attach(io: File.open(file_path), filename: 'default-image_scenery.jpeg', content_type: 'image/jpeg')
    end
    image
  end
end
