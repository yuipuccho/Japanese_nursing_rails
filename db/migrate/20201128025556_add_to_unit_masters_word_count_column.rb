class AddToUnitMastersWordCountColumn < ActiveRecord::Migration[6.0]
  def change
    add_column :unit_masters, :word_count, :integer, default: 0, null: false
  end
end
