# frozen_string_literal: true

class BreedInfo < ApplicationRecord
  validates :name, presence: true
end
