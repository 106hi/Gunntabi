class Customer < ApplicationRecord
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable, :trackable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :validatable

  has_one_attached :image
  has_many :posts, dependent: :destroy
  has_many :favorites, dependent: :destroy
  has_many :post_comments, dependent: :destroy

  validates :last_name, presence: true
  validates :first_name, presence: true
  validates :nickname, presence: true
  validates :email, presence: true
  validates :phone_number, presence: true

  def get_image
    unless image.attached?
      file_path = Rails.root.join('app/assets/images/no_image.jpg')
      image.attach(io: File.open(file_path), filename: 'default-image.jpg', content_type: 'image/jpeg')
    end
    image
  end

  def self.guest
    find_or_create_by!(last_name: 'guest', first_name: 'customer', email: 'guest@example.com') do |customer|
      customer.password = SecureRandom.urlsafe_base64
    end
  end

  def full_name
    "#{last_name} #{first_name}"
  end
end
