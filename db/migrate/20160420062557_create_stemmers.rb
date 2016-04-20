class CreateStemmers < ActiveRecord::Migration
  def change
    create_table :stemmers do |t|
      t.string :content
      t.timestamps
    end
  end
end
