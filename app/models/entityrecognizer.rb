class Entityrecognizer < ActiveRecord::Base
  validates :content, presence: true
end