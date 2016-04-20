class Conceptextract < ActiveRecord::Base
  validates :content, presence: true
end