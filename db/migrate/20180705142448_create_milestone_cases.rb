class CreateMilestoneCases < ActiveRecord::Migration
  def change
    create_table :milestone_cases do |t|
      t.references :project_module, index: true, foreign_key: true, null: false
      t.references :module_test_case, index: true, foreign_key: true, null: false
      t.references :milestone, index: true, foreign_key: true, null: false
      t.string :status
      t.datetime :deleted_at
      t.timestamps null: false
    end
  end
end
