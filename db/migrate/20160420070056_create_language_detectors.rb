class CreateLanguageDetectors < ActiveRecord::Migration
  def change
    create_table :language_detectors do |t|
      t.string :content
      t.timestamps
    end
  end
end
