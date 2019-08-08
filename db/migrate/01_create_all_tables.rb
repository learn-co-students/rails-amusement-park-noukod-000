class CreateAllTables < ActiveRecord::Migration[4.2]
  def change
    create_table :users do |col|
      col.string :name
      col.string :password_digest
      col.integer :nausea
      col.integer :happiness
      col.integer :tickets
      col.integer :height
      col.boolean :admin,default: false
      col.timestamps
    end

    create_table :attractions do |col|
      col.string :name
      col.integer :tickets
      col.integer :nausea_rating
      col.integer :happiness_rating
      col.integer :min_height
      col.timestamps
    end

    create_table :rides do |col|
      col.integer :user_id
      col.integer :attraction_id
    end
  end

end
