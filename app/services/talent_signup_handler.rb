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
end
