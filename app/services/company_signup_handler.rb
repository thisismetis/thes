class CompanySignupHandler
  COMPANY = "Company"

  def initialize(client, oauth)
    @oauth = oauth
    @client = client
    @gatherer = CompanyDataGatherer.new client
    @processes = []
    add_processes
  end

  def process
    company, data = pre_processor
    company = process_company(company, data)
    company.save
    company
  end

  private

  attr_reader :client, :gatherer, :processes, :oauth

  def process_company(company, data)
    processes.inject(company) do |company, process|
      process.run(company, data)
    end
  end

  def pre_processor
    company = Company.new
    company.profile = CompanyProfile.new
    data = gatherer.run
    [company, data]
  end

  def add_processes
    processes << UserHandler.new(oauth)
    processes << CompanyProfileGenerator.new
    processes << IndustriesHandler.new
    processes << LocationsHandler.new
  end
end
