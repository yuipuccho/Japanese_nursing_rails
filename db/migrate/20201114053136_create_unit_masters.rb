class CreateUnitMasters < ActiveRecord::Migration[6.0]
  def change
    create_table :unit_masters do |t|
      t.string :japanese, null: false
      t.string :vietnamese, null: false
      t.timestamps
    end
  end
end
