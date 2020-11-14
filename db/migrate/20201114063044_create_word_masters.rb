class CreateWordMasters < ActiveRecord::Migration[6.0]
  def change
    create_table :word_masters do |t|
      t.references :unit_master, foreign_key: true

      t.string :furigana
      t.string :japanese, null: false
      t.string :english, null: false
      t.string :vietnamese, null: false
      t.timestamps
    end
  end
end
