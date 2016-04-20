class CreateHashtaggings < ActiveRecord::Migration
  def change
    create_table :hashtaggings do |t|
      t.string :content
      t.timestamps
    end
  end
end
