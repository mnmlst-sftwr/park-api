class CreateEntertainments < ActiveRecord::Migration[5.2]
  def change
    create_table :entertainments do |t|
      t.integer :park_id
      t.string :name
      t.string :slug
      t.timestamps
    end
  end
end
