# frozen_string_literal: true

# This file should ensure the existence of records required to run the application in every environment (production,
# development, test). The code here should be idempotent so that it can be executed at any point in every environment.
# The data can then be loaded with the bin/rails db:seed command (or created alongside the database with db:setup).
#
# Clear existing data
Pet.destroy_all

# Create pets
Pet.find_or_create_by(name: 'Buddy', kind: 'Dog', breed: 'Golden Retriever')
Pet.find_or_create_by(name: 'Whiskers', kind: 'Cat', breed: 'Siamese')
Pet.find_or_create_by(name: 'Tweety', kind: 'Bird', breed: 'Canary')
Pet.find_or_create_by(name: 'Nemo', kind: 'Fish', breed: 'Clownfish')

puts "Created #{Pet.count} pets"

Owner.find_or_create_by(name: 'John') do |owner|
  owner.email = 'john@doe.com'
  owner.phone = '123 456 7890'
  owner.address = 'somewhere'
end

Owner.find_or_create_by(name: 'Max') do |owner|
  owner.email = 'max@sample.com'
  owner.phone = '123 456 0200'
  owner.address = 'somewhere else'
end

puts "Created #{Owner.count} owners"
