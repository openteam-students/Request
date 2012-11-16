class CreateEmails < ActiveRecord::Migration
  def change
    create_table :emails do |t|
      t.string :subject
      t.text :body
      t.references :sender
      t.references :issue
      t.references :project

      t.timestamps
    end
    add_index :emails, :sender_id
    add_index :emails, :issue_id
    add_index :emails, :project_id
  end
end
