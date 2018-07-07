class CreateProjects < ActiveRecord::Migration
  def change
    create_table :projects do |t|
      t.string :title
      t.datetime :deleted_at
      t.boolean :deleted
      t.timestamps null: false
    end
  end
end
