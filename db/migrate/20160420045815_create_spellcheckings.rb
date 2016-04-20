class CreateSpellcheckings < ActiveRecord::Migration
  def change
    create_table :spellcheckings do |t|
      t.string :content
      t.timestamps
    end
  end
end
