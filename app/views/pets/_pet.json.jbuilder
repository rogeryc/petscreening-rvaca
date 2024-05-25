json.extract! pet, :id, :name, :kind, :breed, :weight, :owner_id, :created_at, :updated_at
json.url pet_url(pet, format: :json)
