class CreateLanguages < ActiveRecord::Migration
  def change
    create_table :languages do |t|
      t.string :content
      t.timestamps
    end
  end
end
