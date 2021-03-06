class CreateComments < ActiveRecord::Migration
  def change
    create_table :comments do |t|
      t.integer :user_id
      t.integer :project_id
      t.string  :uuid
      t.text    :body

      t.timestamps
    end
    
    add_index :comments, :uuid, unique: true

  end
end
