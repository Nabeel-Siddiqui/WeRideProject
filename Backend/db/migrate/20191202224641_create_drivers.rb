class CreateDrivers < ActiveRecord::Migration[6.0]
  def change
    create_table :drivers do |t|
      t.string :name
      t.string :car
      t.integer :rating
      t.string :image

      t.timestamps
    end
  end
end
