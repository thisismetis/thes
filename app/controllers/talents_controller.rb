class TalentsController < ApplicationController
  def create
    linkedin_client = authorize_with_linkedin
    talent = new_talent(linkedin_client)
    redirect_to edit_talent_proficiency_list_path(talent)
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
