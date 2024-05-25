require 'rails_helper'

RSpec.describe PetsController, type: :controller do
  describe 'GET #index' do
    before do
      create_list(:pet, 2)
    end

    it 'returns a success response with data' do
      get :index
      expect(response).to be_successful
      expect(assigns(:pets).size).to eq(2)
    end
  end

  describe 'GET #show' do
    let(:pet) { create(:pet) }

    it 'returns a success response' do
      get :show, params: { id: pet.id }
      expect(response).to be_successful
    end

    it 'assigns the requested pet as @pet' do
      get :show, params: { id: pet.id }
      expect(assigns(:pet)).to eq(pet)
    end
  end

  describe 'POST #create' do
    let(:valid_attributes) { 
      { 
        name: Faker::Creature::Dog.name, 
        kind: Faker::Creature::Animal.name, 
        breed: Faker::Creature::Dog.breed 
      } 
    }
    let(:invalid_attributes) {
      {
        name: nil,
        kind: Faker::Creature::Animal.name,
        breed: Faker::Creature::Dog.breed 
      }
    }
    
    context 'with valid params' do
      it 'creates a new Pet' do
        expect {
          post :create, params: { pet: valid_attributes }
        }.to change(Pet, :count).by(1)
      end

      it 'renders a JSON response with the new pet' do
        post :create, params: { pet: valid_attributes }, format: :json
        expect(response).to have_http_status(:created)
        expect(response.content_type).to match(a_string_including('application/json'))
        expect(response.location).to eq(pet_url(Pet.last))
      end
    end

    context 'with invalid params' do
      it 'renders a JSON response with errors for the new pet' do
        post :create, params: { pet: invalid_attributes }, format: :json
        expect(response).to have_http_status(:unprocessable_entity)
        expect(response.content_type).to match(a_string_including('application/json'))
        expect(JSON.parse(response.body)['name']).to include("can't be blank")
      end
    end
  end

  describe 'PUT #update' do
    let(:pet) { create(:pet) }
  
    context 'with valid params' do
      let(:new_attributes) { { name: 'Buddy' } }

      it 'updates the requested pet' do
        put :update, params: { id: pet.id, pet: new_attributes }
        pet.reload
        expect(pet.name).to eq('Buddy')
      end

      it 'renders a JSON response with the updated pet' do
        put :update, params: { id: pet.id, pet: new_attributes }, format: :json
        expect(response).to have_http_status(:ok)
        expect(response.content_type).to match(a_string_including('application/json'))
        expect(response).to render_template(:show)
      end
    end

    context 'with invalid params' do
      it 'renders a JSON response with errors for the pet' do
        put :update, params: { id: pet.id, pet: { name: nil } }, format: :json
        expect(response).to have_http_status(:unprocessable_entity)
        expect(response.content_type).to match(a_string_including('application/json'))
        expect(JSON.parse(response.body)['name']).to include("can't be blank")
      end
    end
  end

  describe 'DELETE #destroy' do
    let!(:pet) { create(:pet) }

    it 'destroys the requested pet' do
      expect {
        delete :destroy, params: { id: pet.id }
      }.to change(Pet, :count).by(-1)
    end
  end
end