class CreateParks < ActiveRecord::Migration[5.2]
  def change
    create_table :parks do |t|
      t.integer :resort_id
      t.string :name
      t.string :slug
      t.string :location
      t.float :lat
      t.float :lon
      t.timestamps
    end
  end
end
