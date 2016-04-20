class CreateNounphrasesextractions < ActiveRecord::Migration
  def change
    create_table :nounphrasesextractions do |t|
      t.string :content
      t.timestamps
    end
  end
end
