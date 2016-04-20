class CreateSentiments < ActiveRecord::Migration
  def change
    create_table :sentiments do |t|
      t.string :content
      t.timestamps
    end
  end
end
