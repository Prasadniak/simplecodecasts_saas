class Articlextract < ActiveRecord::Base
  validates :content, presence: true
end