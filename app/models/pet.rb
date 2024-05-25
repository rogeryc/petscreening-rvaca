class Pet < ApplicationRecord
  validates :name, :kind, :breed, presence: true
end
