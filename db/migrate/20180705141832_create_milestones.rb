class CreateMilestones < ActiveRecord::Migration
  def change
    create_table :milestones do |t|
      t.string :name
      t.references :project, index: true, foreign_key: true, null: false
      t.datetime :start_date
      t.datetime :end_date
      t.string :status
      t.datetime :deleted_at
      t.timestamps null: false
    end
  end
end
