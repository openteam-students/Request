class CreatePeople < ActiveRecord::Migration
  def change
    create_table :people do |t|
      t.string :surname
      t.string :name
      t.string :patronymic
      t.string :email
      t.string :type

      t.timestamps
    end
  end
end
