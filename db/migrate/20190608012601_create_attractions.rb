class CreateAttractions < ActiveRecord::Migration[5.2]
  def change
    create_table :attractions do |t|
      t.integer :park_id
      t.string :name
      t.string :slug
      t.timestamps
    end
  end
end
