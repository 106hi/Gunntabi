class Post < ApplicationRecord
  has_many_attached :image
  belongs_to :customer
  has_many :favorites, dependent: :destroy

  def get_image
    unless image.attached?
      file_path = Rails.root.join('app/assets/images/no_image_scenery_gray.jpeg')
      image.attach(io: File.open(file_path), filename: 'default-image_scenery.jpeg', content_type: 'image/jpeg')
    end
    image
  end

  def favorited_by?(customer)
    favorites.exists?(customer_id: customer.id)
  end
end
