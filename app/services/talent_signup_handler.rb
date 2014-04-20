class TalentSignupHandler
  include SignupHandler
  TALENT = "Talent"

  def initialize(client)
    @client = client
    @gatherer = TalentDataGatherer.new client
    @processes = []
    add_processes
  end

  def process
    talent, data = pre_processor
    processors.each do |processor|
      talent = processor.run(talent, data)
    end
    talent.save
  end

  private

  attr_reader :client

  def pre_processor
    talent = Talent.new
    data = gatherer.get_data
    [talent, data]
  end

  def add_processes
    processes << UserHandler.new(client)
    processes << SkillHandler.new
    processes << TalentProfileGenerator.new
  end

  def make_profile(talent, details)
    TalentProfile.create(
      first_name: details["first_name"],
      last_name: details["last_name"],
      industry: details["industry"],
      summary: details["summary"],
      talent: talent
    )
  end

end
