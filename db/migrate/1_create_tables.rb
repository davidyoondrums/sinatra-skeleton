class CreateTables < ActiveRecord::Migration

  def change
    create_table :users do |t|
      t.string :username
      t.string :email
      t.string :password
      t.timestamps
    end

    create_table :cards do |t|
      t.text :explanation
      t.string :name
      t.float :price
      t.integer :stephita_id
      t.string :image_url
      t.timestamps
    end

    


  end

end