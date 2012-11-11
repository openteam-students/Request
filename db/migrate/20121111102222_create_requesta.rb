class CreateRequesta < ActiveRecord::Migration
  def change
    create_table :requesta do |t|
      t.string :theme
      t.datetime :date_time
      t.string :text
      t.integer :id_source
      t.integer :id_project
      t.integer :id_performer
      t.string :status_request

      t.timestamps
    end
  end
end
