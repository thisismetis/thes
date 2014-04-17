class TalentsController < ApplicationController
  def show
  end

  def create
    token = get_linkedin_request_token
    talent = Talent.create token
    redirect_to talent
  end
end
