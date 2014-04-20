class TalentDataGatherer

  def initialize(client)
    @client = client
    @fields = fields_to_get
  end

  def run
    client.get_talent_profile(fields: fields)
  end

  private

  attr_reader :client, :fields

  def fields_to_get
    [
      "first-name",
      "last-name",
      "email-address",
      :industry,
      :summary,
      :skills
    ]
  end
end
