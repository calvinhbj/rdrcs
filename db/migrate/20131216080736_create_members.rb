class CreateMembers < ActiveRecord::Migration
  def change
    create_table :members do |t|
      t.string :name
      t.integer :sex
      t.string :tel
      t.string :email
      t.integer :saler_id

      t.timestamps
    end
  end
end
