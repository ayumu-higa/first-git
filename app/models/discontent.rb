class Discontent < ApplicationRecord
  belongs_to :user
  validates :title, presence: true, length: { maximum: 255 }
  validates :content, presence: true, length: { minimum: 15, maximum: 255 }
  validates :category_id, presence: true, length: { maximum: 255 }
  validates :payment, presence: true, length: { maximum: 255 }
  has_many :likes,dependent: :destroy
  belongs_to :category
end
