# frozen_string_literal: true

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
    specific_breed_data = find_breed(all_breeds, breed)

    if specific_breed_data
      process_breed_info(specific_breed_data['attributes'])
    else
      BreedInfo.find_by(name: breed)
    end
  end

  def self.process_breed_info(breed_data)
    BreedInfo.find_or_create_by(name: breed_data['name'], min_life: breed_data['life']['min'], max_life: breed_data['life']['max'],
                                description: breed_data['description'], hypoallergenic: breed_data['hypoallergenic'])
  end

  def self.find_breed(all_breeds, breed)
    all_breeds.find do |entry|
      entry['attributes']['name'] == breed
    end
  end
end
