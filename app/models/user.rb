class User < ApplicationRecord
    has_many :likes, dependent: :destroy
    has_many :like_tweets, through: :likes, source: :tweet
end
