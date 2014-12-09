class Journalist < ActiveRecord::Base
  attr_accessible :first_name, :last_name, :title, :media_outlet, :twitter

  has_many :media_lists
  has_many :users, through: :media_lists

  has_many :stories
  has_many :positions
  has_many :publishers, through: :positions

  has_many :comments, as: :commentable

  def self.twitter_auth
    client = Twitter::REST::Client.new do |config|
      config.consumer_key        = ENV["JRM_TWITTER_CONSUMER_KEY"]
      config.consumer_secret     = ENV["JRM_TWITTER_SECRET_KEY"]
      config.access_token        = ENV["JRM_TWITTER_ACCESS_TOKEN"]
      config.access_token_secret = ENV["JRM_TWITTER_ACCESS_TOKEN_SECRET"]
    end
  end

  def publisher
    positions = @journalist.positions
      positions.each do |position|
        position.title
        position.publisher.name
      end

  end

end
