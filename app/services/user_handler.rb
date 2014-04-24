class UserHandler

  def initialize(oauth)
    @oauth = oauth
  end

  def run(user, data)
    parse_data data
    user.email = email
    user.oauth = oauth
    user
  end

  private

  attr_reader :email, :oauth

  def parse_data(data)
    @email = data["email_address"]
  end
end
