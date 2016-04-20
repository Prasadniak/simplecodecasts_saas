class Postagger < ActiveRecord::Base
  validates :content, presence: true
end