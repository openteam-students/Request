class CreatePerformers < ActiveRecord::Migration
  def change
    create_table :performers do |t|
      t.string :contact_face
      t.string :email

      t.timestamps
    end
  end
end
