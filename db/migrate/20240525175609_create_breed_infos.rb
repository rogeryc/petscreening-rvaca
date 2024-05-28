# frozen_string_literal: true

class CreateBreedInfos < ActiveRecord::Migration[7.1]
  def change
    create_table :breed_infos do |t|
      t.string :name
      t.text :description
      t.integer :min_life
      t.integer :max_life
      t.boolean :hypoallergenic

      t.timestamps
    end
  end
end
