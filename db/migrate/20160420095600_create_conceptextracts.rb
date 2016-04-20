class CreateConceptextracts < ActiveRecord::Migration
  def change
    create_table :conceptextracts do |t|
      t.string :content
      t.timestamps
    end
  end
end
