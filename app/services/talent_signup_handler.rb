class TalentSignupHandler
  TALENT = "Talent"

  def initialize(client, oauth)
    @oauth = oauth
    @client = client
    @gatherer = TalentDataGatherer.new client
    @processes = []
    add_processes
  end

  def process
    talent, data = pre_processor
    talent = process_talent(talent, data)
    talent.save
    talent
  end

  private

  attr_reader :client, :oauth, :gatherer, :processes

  def process_talent(talent, data)
    processes.inject(talent) do |talent, process|
      process.run(talent, data)
    end
  end

  def pre_processor
    talent = Talent.new
    data = gatherer.run
    [talent, data]
  end

  def add_processes
    processes << UserHandler.new(oauth)
    processes << TalentProfileGenerator.new
    processes << SkillsHandler.new
  end
end
