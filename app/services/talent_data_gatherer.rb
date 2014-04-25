class TalentDataGatherer

  def initialize(client)
    @client = client
  end

  def run
    client.get_talent_profile(fields: fields)
  end

  private

  attr_reader :client

  def fields
    [
      "first-name",
      "last-name",
      "email-address",
      "picture-url",
      :industry,
      :summary,
      :skills,
      "site-standard-profile-request"
    ]
  end
end
