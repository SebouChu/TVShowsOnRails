class Show < ApplicationRecord
  validates :title, presence: true
  validates :plot, presence: true

  has_and_belongs_to_many :users
  has_many :comments, dependent: :destroy

  has_attached_file :poster, styles: {
    tiny: '77x111>',
    thumb: '155x222>',
    medium: '310x444>'
  }

  validates_attachment_content_type :poster, :content_type => /\Aimage\/.*\Z/
  validates_attachment_size :poster, :less_than => 2.megabytes
end
