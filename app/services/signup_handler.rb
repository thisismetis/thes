module SignupHandler
  def initialize(client)
    @client = client
    @gatherer = DataGatherer.new client
    @processes = []
  end

  def process
    data = gatherer.get_data
    processors.each do |processor|
      processor.run data
    end
  end

  private

  attr_reader :client, :processes

  def make_user(email, type)
    User.create(email: email, type: type)
  end

  def make_oauth(user)
    LinkedinOauthSetting.create(
      atoken: client.atoken,
      asecret: client.asecret,
      user: user)
  end

  def get_profile_generator
    generator = "#{type}ProfileGenerator".constantize
    generator.new type
  end

end
