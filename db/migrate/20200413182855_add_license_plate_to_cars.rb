class AddLicensePlateToCars < ActiveRecord::Migration[6.0]
  def change
    add_column :cars, :license_plate, :string
  end
end
