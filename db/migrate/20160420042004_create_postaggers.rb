class CreatePostaggers < ActiveRecord::Migration
  def change
    create_table :postaggers do |t|
      t.string :content
      t.timestamps
    end
  end
end
