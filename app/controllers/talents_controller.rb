class TalentsController < ApplicationController
  def create
    linkedin_client = authorize_with_linkedin
    redirect_to new_talent(linkedin_client)
  end

  def show
    @talent = Talent.find(params[:id])
    @profile = @talent.profile
  end

  private

  def new_talent(client)
    handler = TalentSignupHandler.new client
    handler.process
  end
end
