class CreateLemmatizzers < ActiveRecord::Migration
  def change
    create_table :lemmatizzers do |t|
      t.string :content
      t.timestamps
    end
  end
end
