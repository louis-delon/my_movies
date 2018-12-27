class User < ApplicationRecord
  before_create :set_username

  mount_uploader :avatar, PhotoUploader
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable, :trackable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :validatable

  private

  def set_username
      self.username = "#{self.email[/^[^@]+/]}-#{SecureRandom.hex(1)}"
    end

end
