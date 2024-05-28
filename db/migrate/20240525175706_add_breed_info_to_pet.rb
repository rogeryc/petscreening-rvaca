# frozen_string_literal: true

class AddBreedInfoToPet < ActiveRecord::Migration[7.1]
  def change
    add_reference :pets, :breed_info, foreign_key: true
  end
end
