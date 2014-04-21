class LocationsHandler
  def run(user, data)
    parse_locations data
    locations = generate_locations
    user.profile.locations = locations
    user
  end

  private

  attr_reader :locations

  def parse_locations(data)
    @locations = data["locations"]["all"]
  end

  def generate_locations
    locations.map do |location|
      Location.create(
        postal_code: location["address"]["postal_code"]
      )
    end
  end
end
