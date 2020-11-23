class CreateUserLearningTargets < ActiveRecord::Migration[6.0]
  def change
    create_table :user_learning_targets do |t|
      t.references :user, foreign_key: true

      t.integer :target_learning_count, null: false, default: 0
      t.integer :target_testing_count, null: false, default: 0
      t.timestamps
    end
  end
end
