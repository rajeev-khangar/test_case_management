class CreateModuleTestCases < ActiveRecord::Migration
  def change
    create_table :module_test_cases do |t|
      t.string :title
      t.text :description
      t.references :project_module, index: true, foreign_key: true, null: false
      t.datetime :deleted_at
      t.boolean :deleted
      t.timestamps null: false
    end
  end
end
