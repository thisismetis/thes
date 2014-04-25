class CompanyDataGatherer
  def initialize(client)
    @client = client
  end

  def run
    client.get_company_profile(company_id, fields)
  end

  private

  attr_reader :client

  def company_id
    companies = client.companies.to_hash
    companies["all"].first["id"]
  end

  def fields
    [
      :name,
      "logo-url",
      "employee-count-range",
      :locations,
      :industries,
      :description
    ]
  end
end
