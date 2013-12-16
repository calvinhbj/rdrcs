class CreateProducts < ActiveRecord::Migration
  def change
    create_table :products do |t|
      t.string :code
      t.string :name
      t.float :price
      t.integer :status
      t.text :description

      t.timestamps
    end
  end
end
