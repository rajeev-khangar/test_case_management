class CreateProjectModules < ActiveRecord::Migration
  def change
    create_table :project_modules do |t|
      t.string :module_name
      t.references :project, index: true, foreign_key: true, null: false
      t.datetime :deleted_at
      t.boolean :deleted
      t.timestamps null: false
    end
  end
end
