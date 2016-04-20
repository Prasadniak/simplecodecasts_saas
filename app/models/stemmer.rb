class Stemmer < ActiveRecord::Base
  validates :content, presence: true
end