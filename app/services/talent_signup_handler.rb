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
    processes.each do |process|
      talent = process.run(talent, data)
    end
    talent.save
    talent
  end

  private

  attr_reader :client, :gatherer, :processes

  def pre_processor
    talent = Talent.new
    talent.profile = TalentProfile.new
    data = gatherer.run
    [talent, data]
  end

  def add_processes
    processes << UserHandler.new(client)
    processes << SkillHandler.new
    processes << TalentProfileGenerator.new
  end

end
