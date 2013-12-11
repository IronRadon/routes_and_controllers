class CreateCommentsTable < ActiveRecord::Migration
  def change
    create_table :comments do |t|
      t.text :comment, :null => :false
      t.integer :user_id, :null => :false
      t.integer :contact_id, :null => :false

      t.timestamps
    end
    add_index :comments, :user_id
    add_index :comments, :contact_id
  end
end
