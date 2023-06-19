class Post < ApplicationRecord
  has_one_attached :image
  belongs_to :customer
  has_many :favorites, dependent: :destroy
  has_many :post_comments, dependent: :destroy
  has_many :tag_maps, dependent: :destroy
  has_many :tags, through: :tag_maps

  enum area: {"---":0, north_area:1, central_area:2, west_area:3, east_area:4}

  def get_post_image
    unless image.attached?
      file_path = Rails.root.join('app/assets/images/no_image_scenery_gray.jpeg')
      image.attach(io: File.open(file_path), filename: 'default-image_scenery.jpeg', content_type: 'image/jpeg')
    end
    image
  end

  def favorited_by?(customer)
    favorites.exists?(customer_id: customer.id)
  end

  def save_tag(sent_tags)
    #createで保存した@postに紐づいているタグが存在する場合「タグの名前を配列として」全て取得
    current_tags = self.tags.pluck(:tag_name) unless self.tags.nil?
    old_tags = current_tags - sent_tags
    new_tags = sent_tags - current_tags

    #古いタグを削除
    old_tags.each do |old|
      self.tags.delete Tag.find_by(tag_name: old)
    end

    #新しいタグをデータベースに保存
    new_tags.each do |new|
      new_post_tag = Tag.find_or_create_by(tag_name: new)
      self.tags << new_post_tag
    end
  end

  def self.search(keyword)
    where(["post_name like? OR introduction like?", "%#{keyword}%", "%#{keyword}%"])
  end
end
