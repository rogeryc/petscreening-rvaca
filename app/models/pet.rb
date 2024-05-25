class Pet < ApplicationRecord
  validates :name, :kind, :breed, presence: true
  validates :weight, numericality: { greater_than: 0 }, allow_nil: true
end
