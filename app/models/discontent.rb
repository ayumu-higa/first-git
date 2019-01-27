class Discontent < ApplicationRecord
  belongs_to :user
  validates :title, presence: true, length: { maximum: 255 }
  validates :content, presence: true, length: { maximum: 255 }
  has_many :likes,dependent: :destroy
end
