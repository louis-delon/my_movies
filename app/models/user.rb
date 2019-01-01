class User < ApplicationRecord
  mount_uploader :avatar, PhotoUploader
  before_create :set_username
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable, :trackable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :validatable

  has_many :movies, dependent: :destroy

  private

  def set_username
    self.username = "#{self.email[/^[^@]+/]}-#{SecureRandom.hex(1)}"
  end

  # def set_avatar
  #   self.avatar = "default-avatar.png"
  # end

end
