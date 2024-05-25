class BackfillPetWeight < ActiveRecord::Migration[7.1]
  disable_ddl_transaction!
 
  Pet.update_all(weight: 0)
end
