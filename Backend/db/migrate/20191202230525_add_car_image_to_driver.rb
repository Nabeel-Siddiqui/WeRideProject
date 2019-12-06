class AddCarImageToDriver < ActiveRecord::Migration[6.0]
  def change
    add_column :drivers, :car_image, :string
  end
end
