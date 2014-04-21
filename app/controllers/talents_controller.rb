class TalentsController < ApplicationController
  def create
    linkedin_client = authorize_with_linkedin
    redirect_to new_talent(linkedin_client)
  end

  private

  def new_talent(client)
    handler = TalentSignupHandler.new client
    handler.process
  end
end
