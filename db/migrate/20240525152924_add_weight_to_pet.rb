class AddWeightToPet < ActiveRecord::Migration[7.1]
  def change
    add_column :pets, :weight, :decimal
  end
end
