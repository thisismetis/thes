class CompaniesController < ApplicationController
  def show
  end

  def create
    linkedin_client = authorize_with_linkedin
    handler = CompanySignupHandler.new linkedin_client
    company = handler.process
    redirect_to company
  end
end
