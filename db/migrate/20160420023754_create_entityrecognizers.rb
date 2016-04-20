class CreateEntityrecognizers < ActiveRecord::Migration
  def change
    create_table :entityrecognizers do |t|
      t.string :content
      t.timestamps
    end
  end
end
