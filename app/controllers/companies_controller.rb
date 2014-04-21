class CompaniesController < ApplicationController
  def show
  end

  def create
    linkedin_client = authorize_with_linkedin
    redirect_to new_company(linkedin_client)
  end

  private

  def new_company(client)
    handler = CompanySignupHandler.new client
    handler.process
  end
end
