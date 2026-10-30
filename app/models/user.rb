class User < ApplicationRecord
  has_secure_password

  has_many :tweets, dependent: :destroy
  has_many :likes, dependent: :destroy
  has_many :like_tweets, through: :likes, source: :tweet

  # ユーザー登録時のパスワード確認機能
  validates :password, presence: true, confirmation: true, on: :create

  def like(tweet)
    like_tweets << tweet unless liked?(tweet)
  end

  def unlike(tweet)
    like_tweets.delete(tweet)
  end

  def liked?(tweet)
    like_tweets.include?(tweet)
  end
end