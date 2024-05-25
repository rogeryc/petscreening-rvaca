require 'rails_helper'

RSpec.describe Pet, type: :model do
  describe 'associations' do
    it { should belong_to(:owner).optional }
  end

  describe 'validations' do
    it { should validate_presence_of(:name) }
    it { should validate_presence_of(:kind) }
    it { should validate_presence_of(:breed) }
    it { should validate_numericality_of(:weight) }
  end

  describe 'attributes' do
    describe '#name' do
      it 'is invalid when nil' do
        pet = Pet.new(name: nil, kind: 'Dog', breed: 'Labrador')
        expect(pet).to be_invalid
      end
    end

    describe '#kind' do
      it 'is invalid when nil' do
        pet = Pet.new(name: 'Buddy', kind: nil, breed: 'Labrador')
        expect(pet).to be_invalid
      end
    end

    describe '#breed' do
      it 'is invalid when nil' do
        pet = Pet.new(name: 'Buddy', kind: 'Dog', breed: nil)
        expect(pet).to be_invalid
      end
    end

    describe '#weight' do
      it 'is valid when nil' do
        pet = Pet.new(name: 'Buddy', kind: 'Dog', breed: 'Labrador', weight: nil)
        expect(pet).to be_valid
      end

      it 'is valid when greater than or equal to zero' do
        pet = Pet.new(name: 'Buddy', kind: 'Dog', breed: 'Labrador', weight: 10)
        expect(pet).to be_valid
        pet.weight = 0
        expect(pet).to be_valid
      end

      it 'is valid when lower than or equeal to zero' do
        pet = Pet.new(name: 'Buddy', kind: 'Dog', breed: 'Labrador', weight: -1)
        expect(pet).to be_invalid
      end
    end
  end

  describe 'model actions' do
    let(:valid_attributes) { { name: 'Max', kind: 'Dog', breed: 'Labrador Retriever' } }
    let(:invalid_attributes) { { name: nil, kind: nil, breed: nil } }

    it 'creates a pet with valid attributes' do
      pet = Pet.new(valid_attributes)
      expect(pet.save).to be true
    end

    it 'does not create a pet with invalid attributes' do
      pet = Pet.new(invalid_attributes)
      expect(pet.save).to be false
    end

    it 'updates a pet with valid attributes' do
      pet = Pet.create(valid_attributes)
      new_attributes = { name: 'Buddy', kind: 'Dog', breed: 'Golden Retriever' }
      expect(pet.update(new_attributes)).to be true
    end

    it 'does not update a pet with invalid attributes' do
      pet = Pet.create(valid_attributes)
      new_attributes = { name: nil, kind: nil, breed: nil }
      expect(pet.update(new_attributes)).to be false
    end
  end
end