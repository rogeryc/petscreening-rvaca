# frozen_string_literal: true

require 'rails_helper'

RSpec.describe Owner, type: :model do
  describe 'associations' do
    it { should have_many(:pets) }
  end

  describe 'validations' do
    it { should validate_presence_of(:name) }
    it { should validate_presence_of(:email) }
  end

  describe 'attributes' do
    describe '#name' do
      it 'is invalid when nil' do
        owner = Owner.new(name: nil, email: 'john@doe.com')
        expect(owner).to be_invalid
      end
    end

    describe '#email' do
      it 'is invalid when nil' do
        owner = Owner.new(name: 'John', email: nil)
        expect(owner).to be_invalid
      end
    end
  end

  describe 'model actions' do
    let(:valid_attributes) { { name: 'John', email: 'john@doe.com', phone: '123 456 7890', address: 'somewhere' } }
    let(:invalid_attributes) { { name: nil, email: nil, phone: '123 456 7890', address: 'somewhere' } }

    it 'creates a owner with valid attributes' do
      owner = Owner.new(valid_attributes)
      expect(owner.save).to be true
    end

    it 'does not create a owner with invalid attributes' do
      owner = Owner.new(invalid_attributes)
      expect(owner.save).to be false
    end

    it 'updates a owner with valid attributes' do
      owner = Owner.create(valid_attributes)
      new_attributes = { name: 'Max', email: 'max@doe.com' }
      expect(owner.update(new_attributes)).to be true
    end

    it 'does not update a owner with invalid attributes' do
      owner = Owner.create(valid_attributes)
      new_attributes = { name: nil, email: nil }
      expect(owner.update(new_attributes)).to be false
    end
  end
end
