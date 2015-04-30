class CreateTables < ActiveRecord::Migration

  def change
    create_table :users do |t|
      t.string :username
      t.string :email
      t.string :password
      t.string :firstname
      t.string :lastname
      t.timestamps
    end

    create_table :products do |t|
      t.text :explanation
      t.string :name
      t.float :price
      t.integer :stephita_id
      t.string :image_url
      t.integer :type
      t.boolean :select
      t.integer :catagory
      t.integer :collection
      t.boolean :promotion
      t.references :user
      t.timestamps
    end

    


  end

end