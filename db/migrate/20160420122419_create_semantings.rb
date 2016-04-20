class CreateSemantings < ActiveRecord::Migration
  def change
    create_table :semantings do |t|
      t.string :content
      t.string :content1
      t.timestamps
    end
  end
end
