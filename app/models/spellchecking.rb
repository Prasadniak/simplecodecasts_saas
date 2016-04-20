class Spellchecking < ActiveRecord::Base
  validates :content, presence: true
end