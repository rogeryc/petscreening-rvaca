require 'net/http'
require 'uri'
require 'json'

class BreedData
  def self.call(breed)
    uri = URI.parse('https://dogapi.dog/api/v2/breeds')
    response = Net::HTTP.get_response(uri)

    # Parse JSON response
    all_breeds = JSON.parse(response.body)['data']

    # Find the specific breed in the response
    specific_breed_data = all_breeds.find do |entry|
      entry["attributes"]["name"] == breed
    end
    
    if specific_breed_data
      breed_info = process_breed_info(specific_breed_data['attributes'])
    else
      breed_info = BreedInfo.find_by(name: breed)
    end

    breed_info
  end

  private

  def self.process_breed_info(breed_data)
    breed_info = BreedInfo.find_or_create_by(name: breed_data['name'], min_life: breed_data['life']['min'], max_life: breed_data['life']['max'],
                                             description: breed_data['description'], hypoallergenic: breed_data['hypoallergenic'])
    breed_info
  end
end

