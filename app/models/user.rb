class User < ApplicationRecord
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :trackable, :validatable

  has_and_belongs_to_many :shows
  has_many :comments, dependent: :destroy

  has_attached_file :avatar, styles: {
    tiny: '32x32>',
    thumb: '64x64>',
    medium: '128x128>'
  }

  validates_attachment_content_type :avatar, :content_type => /\Aimage\/.*\Z/
  validates_attachment_size :avatar, :less_than => 4.megabytes
end
