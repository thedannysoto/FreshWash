class CreateWashes < ActiveRecord::Migration[6.0]
  def change
    create_table :washes do |t|
      t.integer :user_id
      t.integer :package_id

      t.timestamps
    end
  end
end
