class CreateTestHistories < ActiveRecord::Migration[6.0]
  def change
    create_table :test_histories do |t|
      t.references :word_master, foreign_key: true
      t.references :user, foreign_key: true

      t.boolean :is_collect_answer, null: false
      t.timestamps
    end
  end
end
