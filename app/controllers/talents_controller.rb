class TalentsController < ApplicationController
  def create
    token, secret = authorize_with_linkedin
    linkedin_client = linkedin.authorize_from_access(token, secret)
    talent_details = linkedin_client.get_profile
    logger.debug talent_details.inspect
    Talent.create talent_details
    LinkedInOauthSetting.create(token, secret, talent.id)
    redirect_to talent
  end
end
