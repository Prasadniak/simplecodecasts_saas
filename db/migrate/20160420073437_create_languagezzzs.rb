class CreateLanguagezzzs < ActiveRecord::Migration
  def change
    create_table :languagezzzs do |t|
      t.string :content
      t.timestamps
    end
  end
end
