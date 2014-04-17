class TalentsController < ApplicationController
  def create
    linkedin_client = authorize_with_linkedin
    handler = TalentSignupHandler.new linkedin_client
    talent = handler.process
    redirect_to talent
  end
end
