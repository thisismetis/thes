class UserHandler

  def initialize(client)
    @atoken = client.atoken
    @asecret = client.asecret
  end

  def run(user, data)
    parse_data data
    user.email = email
    user.oauth = make_oauth
    user
  end

  private

  attr_reader :email, :atoken, :asecret

  def parse_data(data)
    @email = data["email_address"]
  end

  def make_oauth
    LinkedinOauthSetting.new(
      atoken: atoken,
      asecret: asecret)
  end
end
