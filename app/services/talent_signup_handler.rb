class TalentSignupHandler
  TALENT = "Talent"

  def initialize(client)
    @client = client
  end

  def process
    talent_details = client.get_profile
    Rails.logger.debug talent_details.inspect
    talent = make_user talent_details
    make_oauth talent
    make_profile(talent, talent_details)
    store_skills(talent, talent_details["skills"])
  end

  private

  attr_reader :client

  def make_user(details)
    User.create(email: details["email_address"], type: TALENT)
  end

  def make_oauth(talent)
    LinkedinOauthSetting.create(
      atoken: client.atoken,
      asecret: client.asecret,
      user: talent)
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
