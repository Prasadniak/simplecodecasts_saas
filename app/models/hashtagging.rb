class Hashtagging < ActiveRecord::Base
  validates :content, presence: true
end