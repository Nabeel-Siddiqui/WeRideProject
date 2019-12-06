class CreateRides < ActiveRecord::Migration[6.0]
  def change
    create_table :rides do |t|
      t.string :start
      t.string :end
      t.float :cost
      t.belongs_to :driver, null: false, foreign_key: true
      t.belongs_to :rider, null: false, foreign_key: true

      t.timestamps
    end
  end
end
