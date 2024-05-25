class Pet < ApplicationRecord
  validates :name, :kind, :breed, presence: true
  validates :weight, numericality: { greater_than_or_equal_to: 0 }, allow_nil: true

  belongs_to :owner, optional: true
end
