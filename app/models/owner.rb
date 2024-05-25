class Owner < ApplicationRecord
  validates :name, :email, presence: true

  has_many :pets #, dependent: :destroy # uncomment this line to delete all pets when an owner is deleted
end
