class CreateSummarizationzs < ActiveRecord::Migration
  def change
    create_table :summarizationzs do |t|
      t.string :content
      t.timestamps
    end
  end
end
