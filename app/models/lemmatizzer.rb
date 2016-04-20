class Lemmatizzer < ActiveRecord::Base
  validates :content, presence: true
end