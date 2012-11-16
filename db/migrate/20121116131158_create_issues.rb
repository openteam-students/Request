class CreateIssues < ActiveRecord::Migration
  def change
    create_table :issues do |t|
      t.string :state
      t.references :executor
      t.references :project

      t.timestamps
    end
    add_index :issues, :executor_id
    add_index :issues, :project_id
  end
end
