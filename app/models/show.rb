class Show < ApplicationRecord
  validates :title, presence: true
  validates :plot, presence: true

  has_and_belongs_to_many :users
  has_many :comments, dependent: :destroy
end
