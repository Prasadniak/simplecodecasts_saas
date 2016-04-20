class CreateArticlextracts < ActiveRecord::Migration
  def change
    create_table :articlextracts do |t|
      t.string :content
      t.timestamps
    end
  end
end
