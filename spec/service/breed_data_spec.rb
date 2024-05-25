require 'rails_helper'

RSpec.describe BreedData do
  describe '.call' do
    let(:breed) { 'Labrador Retriever' }
    let(:response_body) do
      {
        'data' => [
          { 'attributes' => { 'name' => 'Labrador Retriever', 'life' => { 'max' => 10, 'min' => 2 }, 'description' => 'Nice dog' } },
          { 'attributes' => { 'name' => 'German Shepherd', 'life' => { 'max' => 8, 'min' => 1 }, 'description' => 'Other nice dog' } }
        ]
      }.to_json
    end

    before do
      fake_response = instance_double(Net::HTTPResponse, body: response_body, code: '200')
      allow(Net::HTTP).to receive(:get_response).and_return(fake_response)
    end

    it 'returns the attributes of the specific breed' do
      attributes = BreedData.call(breed)
      expect(attributes['name']).to eq('Labrador Retriever')
    end
  end
end