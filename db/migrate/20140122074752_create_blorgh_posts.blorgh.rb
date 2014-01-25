# This migration comes from blorgh (originally 20140122073905)
class CreateBlorghPosts < ActiveRecord::Migration
  def change
    create_table :blorgh_posts do |t|
      t.string :title
      t.string :descritpion

      t.timestamps
    end
  end
end
