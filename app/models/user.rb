class User < ApplicationRecord
  before_save { self.email.downcase! }
  validates :name, presence: true, length: { maximum: 50 }
  validates :email, presence: true, length: { maximum: 255 },
                    format: { with: /\A[\w+\-.]+@[a-z\d\-.]+\.[a-z]+\z/i },
                    uniqueness: { case_sensitive: false }
  
  has_secure_password
  has_many :discontents, dependent: :destroy
  has_many :likes, dependent: :destroy
  
  has_many :followlikeings, through: :likes, source: :discontent
  
  
  def followlike(other_discontent)
    unless self == other_discontent
      self.likes.find_or_create_by(discontent_id: other_discontent.id)
    end
  end

  def unfollowlike(other_discontent)
    like = self.likes.find_by(discontent_id: other_discontent.id)
    like.destroy if like
  end

  def followlikeing?(other_discontent)
    self.followlikeings.include?(other_discontent)
  end
  
  def feed_discontents
    Discontent.where(user_id: self.followlikeing_ids + [self.id])
  end
  
end
