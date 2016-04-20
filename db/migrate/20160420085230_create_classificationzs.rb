class CreateClassificationzs < ActiveRecord::Migration
  def change
    create_table :classificationzs do |t|
      t.string :content
      t.timestamps
    end
  end
end
