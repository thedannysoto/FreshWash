class ChangeColumnName < ActiveRecord::Migration[6.0]
  def change
    rename_column :cars, :type, :car_type
  end
end
