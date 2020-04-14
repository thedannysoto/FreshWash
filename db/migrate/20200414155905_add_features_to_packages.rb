class AddFeaturesToPackages < ActiveRecord::Migration[6.0]
  def change
    add_column :packages, :features, :string
  end
end
