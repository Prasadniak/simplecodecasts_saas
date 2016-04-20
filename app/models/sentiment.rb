class Sentiment < ActiveRecord::Base
  validates :content, presence: true
end