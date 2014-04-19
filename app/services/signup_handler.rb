module SignupHandler
  def initialize(client)
    @client = client
  end

  private

  attr_reader :client

  def make_user(email, type)
    User.create(email: email, type: type)
  end

  def make_oauth(user)
    LinkedinOauthSetting.create(
      atoken: client.atoken,
      asecret: client.asecret,
      user: user)
  end

end
